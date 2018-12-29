---
title: 'Limiting query results'
---
First 100 rows
```sql
SELECT *
FROM   SOME_TABLE
WHERE  ROWNUM <= 100;
```

First 100 rows of ordered set
```sql
SELECT *
FROM (
  SELECT *
  FROM   SOME_TABLE
  ORDER BY ORDER_COLUMN)
WHERE ROWNUM <= 100;
```

Or with analytic functions
```sql
SELECT *
FROM (
  SELECT T.*,
         ROW_NUMBER() OVER(ORDER BY ORDER_COLUMN)   RNUM
  FROM   SOME_TABLE  T)
WHERE RNUM <= 100;
```
