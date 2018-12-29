---
title: "'Popular' queries"
---
```sql
with
  session_querys AS (
    select sql_id, count(*)  n_query_count
    from v$session    s
    where s.type = 'USER'
    group by sql_id)
select Q.sql_id,
       q.n_query_count,
       s.sql_text
from   session_querys    Q,
       v$sql             S
where  s.sql_id = Q.sql_id
order by q.n_query_count desc;
```
