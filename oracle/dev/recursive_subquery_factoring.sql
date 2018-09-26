CREATE TABLE recursive_subquery (
  id       number,
  name     varchar2(500),
  line_no  number)

insert into recursive_subquery(id, name, line_no) values(23984, 'one', 1);
insert into recursive_subquery(id, name, line_no) values(293845, 'two', 2);
insert into recursive_subquery(id, name, line_no) values(291834, 'four', 4);
insert into recursive_subquery(id, name, line_no) values(21093, 'three', 3);

-- CONNECT BY version
select *
from   recursive_subquery
start with line_no = 1
connect by line_no = prior line_no + 1;

-- Recursive WITH version
WITH  lines(id, name, line_no) AS (
  SELECT id,
         name,
         line_no
  from   recursive_subquery
  where  line_no = 1
  union all
  SELECT T.id,
         T.name,
         T.line_no
  FROM   recursive_subquery   T,
         lines                L
  WHERE  T.line_no        = L.line_no + 1)
select *
from lines;
