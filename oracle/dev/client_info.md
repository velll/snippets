---
title: 'Using client_info'
---
```sql
-- set
exec DBMS_APPLICATION_INFO.SET_CLIENT_INFO('some client string');

DECLARE
  client_info     V$SESSION.CLIENT_INFO%TYPE;
BEGIN
  -- read
  DBMS_APPLICATION_INFO.SET_CLIENT_INFO(client_info);

  -- do stuff
  -- ...
END;
/
```
