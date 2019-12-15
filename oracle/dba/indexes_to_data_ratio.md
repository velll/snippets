---
title: 'Indexes to data ratio'
---
This presumes you use two tablespaces — one for data, one for indexes.

Not all indexes will be in the index tablespaces (some are mistakes, some are just made that way).
```sql
WITH DATA_SIZE AS (
  SELECT OWNER,
         SEGMENT_NAME TABLE_NAME,
         BYTES
  FROM   DBA_SEGMENTS
  WHERE  SEGMENT_TYPE   IN ('TABLE', 'TABLE PARTITION', 'TABLE SUBPARTITION', 'NESTED TABLE')
  AND    TABLESPACE_NAME = :data_tablespace
  UNION ALL
  SELECT L.OWNER,
         L.TABLE_NAME,
         S.BYTES
  FROM   DBA_LOBS     L,
         DBA_SEGMENTS S
  WHERE  S.SEGMENT_NAME    = L.SEGMENT_NAME
  AND    S.OWNER           = L.OWNER
  AND    S.SEGMENT_TYPE   IN ('LOBSEGMENT', 'LOB PARTITION', 'LOB SUBPARTITION', 'LOBINDEX')
  AND    S.TABLESPACE_NAME = :data_tablespace),
INDEX_SIZE AS (
  SELECT I.TABLE_NAME,
         I.OWNER,
         S.BYTES
  FROM   DBA_INDEXES  I,
         DBA_SEGMENTS S
  WHERE  S.SEGMENT_NAME    = I.INDEX_NAME
  AND    S.OWNER           = I.OWNER
  AND    S.SEGMENT_TYPE   IN ('INDEX', 'INDEX PARTITION', 'INDEX SUBPARTITION')
  AND    S.TABLESPACE_NAME = :data_tablespace),
UNION_SIZE AS (
  SELECT OWNER,
         TABLE_NAME,
         BYTES      DATA_BYTES,
         0          INDEX_BYTES
  FROM   DATA_SIZE
  UNION ALL
  SELECT OWNER,
         TABLE_NAME,
         0          DATA_BYTES,
         BYTES      INDEX_BYTES
  FROM   INDEX_SIZE),
INDEX_TB_SIZE AS (
  SELECT I.TABLE_NAME,
         I.OWNER,
         S.BYTES
  FROM   DBA_INDEXES  I,
         DBA_SEGMENTS S
  WHERE  S.SEGMENT_NAME    = I.INDEX_NAME
  AND    S.OWNER           = I.OWNER
  AND    S.TABLESPACE_NAME = :index_tablespace),
TABLE_SIZE AS (
  SELECT OWNER,
         TABLE_NAME,
         NVL(ROUND(SUM(DATA_BYTES)/(1024*1024)), 0)   DATA_MB,
         NVL(ROUND(SUM(INDEX_BYTES)/(1024*1024)), 0)  INDEX_MB
  FROM   UNION_SIZE
  GROUP BY OWNER, TABLE_NAME),
TOTAL_TABLE_SIZE AS (
  SELECT TS.*,
         (DATA_MB + INDEX_MB)  TOTAL_MB,
         ROUND(RATIO_TO_REPORT(DATA_MB + INDEX_MB) OVER () * 100) TOTAL_PCT
  FROM   TABLE_SIZE TS)
SELECT (select instance_name ||'@'||HOST_NAME from v$instance)   INSTANCE_NAME,
       S.*,
       ROUND(DATA_IN_DATA_TB / (INDEXES_IN_DATA_TB + TOTAL_INDEX_TB), 2)    DATA_TO_INDEXES_RATIO,
       ROUND(TOTAL_DATA_TB / TOTAL_INDEX_TB, 2)                             DATA_TB_TO_INDEX_TB_RATIO
FROM   (
  SELECT T.*,
         NVL((select ROUND(SUM(bytes)/(1024*1024)) from INDEX_TB_SIZE), 0)       TOTAL_INDEX_TB

  FROM (
    SELECT SUM(DATA_MB)                                   DATA_IN_DATA_TB,
           ROUND(SUM(DATA_MB) * 100 / SUM(TOTAL_MB), 2)   DATA_IN_DATA_TB_PERCENTAGE,
           SUM(INDEX_MB)                                  INDEXES_IN_DATA_TB,
           SUM(TOTAL_MB)                                  TOTAL_DATA_TB
    FROM   TOTAL_TABLE_SIZE)   T)   S
```
