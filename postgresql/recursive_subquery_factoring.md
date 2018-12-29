---
title: 'Recursive subquery factoring'
---
Prepare table with test data
```sql
CREATE TABLE recursive_subquery (
  id       INTEGER,
  name     TEXT,
  line_no  INTEGER)

INSERT INTO recursive_subquery(id, name, line_no) VALUES(23984,  'one', 1);
INSERT INTO recursive_subquery(id, name, line_no) VALUES(293845, 'two', 2);
INSERT INTO recursive_subquery(id, name, line_no) VALUES(291834, 'four', 4);
INSERT INTO recursive_subquery(id, name, line_no) VALUES(21093,  'three', 3);
```

Recursive query
```sql
WITH RECURSIVE lines(id, name, line_no) AS (
  SELECT id,
         name,
         line_no,
         CAST(null as integer)    parent_id
  FROM   recursive_subquery
  WHERE  line_no = 1
  UNION ALL
  SELECT T.id,
         T.name,
         T.line_no,
         L.id                     parent_id
  FROM   recursive_subquery   T,
         lines                L
  WHERE  T.line_no        = L.line_no + 1)
SELECT *
FROM lines;
```
