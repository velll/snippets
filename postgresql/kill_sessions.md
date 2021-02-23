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

Kill everyone else
```sql
SELECT pg_terminate_backend(pid)
FROM   pg_stat_activity
WHERE  pid <> pg_backend_pid() -- don't kill my own connection!
-- don't kill the connections to other databases
AND    datname = 'db-name';
```
