CREATE TABLE recursive_subquery (
  id       integer,
  name     text,
  line_no  integer)

insert into recursive_subquery(id, name, line_no) values(23984, 'one', 1);
insert into recursive_subquery(id, name, line_no) values(293845, 'two', 2);
insert into recursive_subquery(id, name, line_no) values(291834, 'four', 4);
insert into recursive_subquery(id, name, line_no) values(21093, 'three', 3);

-- Recursive WITH version
WITH RECURSIVE lines(id, name, line_no) AS (
  SELECT id,
         name,
         line_no,
         CAST(null as integer)    parent_id
  from   recursive_subquery
  where  line_no = 1
  union all
  SELECT T.id,
         T.name,
         T.line_no,
         L.id                     parent_id
  FROM   recursive_subquery   T,
         lines                L
  WHERE  T.line_no        = L.line_no + 1)
select *
from lines;
