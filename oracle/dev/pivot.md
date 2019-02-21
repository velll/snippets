---
title: 'Pivoting a table in Oracle'
---
Prepare table data
```sql
CREATE TABLE t (
  acct_no VARCHAR2(3),
  code    VARCHAR2(3),
  meaning VARCHAR2(3)
);

INSERT INTO t VALUES ('123', 'ABC', 'abc');
INSERT INTO t VALUES ('123', 'BVC', 'bvc');
INSERT INTO t VALUES ('123', 'DDD', 'ddd');
```

Use `pivot` in a query
```sql
SELECT *
FROM   t
PIVOT (
   MAX(code) AS CD,
   MAX(meaning) as MN
   FOR (code) in (
     'ABC' as A,
     'BVC' as B,
     'DDD' as D
   )
);
```

Simpler example
```sql
SELECT *
FROM   (
  SELECT id    post id,
         category_id
  FROM   posts p)
pivot (
  count (id)
  for category_id IN (1, 2, 3, 4, 5)
)
```
