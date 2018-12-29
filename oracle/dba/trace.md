---
title: 'Tracing sql'
---
Own session
```sql
exec  DBMS_SESSION.SESSION_TRACE_ENABLE;
-- ...
exec  DBMS_SESSION.SESSION_TRACE_DISABLE;
```

Other session
```sql
exec DBMS_MONITOR.SESSION_TRACE_ENABLE(:sid, :serial);

-- Wait

exec DBMS_MONITOR.SESSION_TRACE_DISABLE(:sid, :serial);
```
