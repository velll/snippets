-- own session
exec  DBMS_SESSION.SESSION_TRACE_ENABLE;
-- ...
exec  DBMS_SESSION.SESSION_TRACE_DISABLE;

-- other session
exec DBMS_MONITOR.SESSION_TRACE_ENABLE(:sid, :serial);

-- Wait

exec DBMS_MONITOR.SESSION_TRACE_DISABLE(:sid, :serial);
