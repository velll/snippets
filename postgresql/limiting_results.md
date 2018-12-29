---
title: 'Limiting query results'
---
First 100 rows
```sql
SELECT *
FROM   SOME_TABLE
LIMIT  100;
```

First 100 rows of an ordered set
```sql
SELECT *
FROM   SOME_TABLE
ORDER BY ORDER_COLUMN
LIMIT 100; -- LIMIT applies after ORDER BY
```

Or with analytic functions
```sql
SELECT Q.*
FROM (
  SELECT T.*,
         ROW_NUMBER() OVER(ORDER BY ORDER_COLUMN)   RNUM
  FROM   SOME_TABLE  T)  Q
WHERE RNUM <= 100;
```
