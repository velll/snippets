---
title: 'SQL collection types in queries'
---
Create a collection type
```sql
create or replace type NUMBER_TABLE as TABLE OF NUMBER
/
```

PL/SQL example
```sql
declare
  nt   NUMBER_TABLE := NUMBER_TABLE (1, 2, 3);
  num_DUM  NUMBER;
BEGIN
  WITH d AS (
    SELECT 1  DUM
    FROM   DUAL)
  SELECT  D.DUM
  INTO    num_DUM
  FROM    D,
          TABLE(nt)   N
  WHERE   D.DUM = N.COLUMN_VALUE;

  RAISE_APPLICATION_ERROR(-20100, num_DUM);
END;
/
-- raises exception with "1"
```
