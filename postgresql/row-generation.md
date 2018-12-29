---
title: 'Row generation'
---
```sql
SELECT 1       CONST,
       s.val   SEQ,
       ROW_NUMBER() OVER(ORDER BY s.val)   RNUM
FROM   generate_series(10, 100) as s(val);
```

And here's how `generate_series` works
```sql
select * from generate_series(1, 5)

generate_series
-----------------
              1
              2
              3
              4
              5
```

```sql
select * from generate_series(1, 10, 2)

generate_series
-----------------
               1
               3
               5
               7
               9
```
