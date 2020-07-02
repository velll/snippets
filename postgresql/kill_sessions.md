---
title: 'Killing PostgreSQL sessions'
---
List sessions
```sql
select * from pg_stat_activity;
```

Kill a single session
```sql
select pg_terminate_backend(pid)
from   pg_stat_activity
where  pid = '1234';
```
