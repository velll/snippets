-- Find sql_id of a problem cursor first!

-- Find cursor address and hash value by sql_id
select ADDRESS, HASH_VALUE from V$SQLAREA where sql_id = :sql_id

-- Purge the cursor out of the shared pool
exec SYS.DBMS_SHARED_POOL.PURGE ('<ADDRESS>, <HASH_VALUE>', 'C');

-- Is it still there?
select count(*) from V$SQLAREA where sql_id = :sql_id

-- If not, good job!
-- If it is, check open cursors
select count(*)
from   v$open_cursor
where  sql_id = :sql_id;

-- Find sessions running this cursor
select distinct sid, serial
from   v$session
where  sid in (
         select sid
         from   v$open_cursor
         where  sql_id = :sql_id)

-- Kill sessions
alter system kill session '<sid>, <serial#>'
/

-- Try purging again
exec SYS.DBMS_SHARED_POOL.PURGE ('<ADDRESS>, <HASH_VALUE>', 'C');

-- Is it still there?
select count(*) from V$SQLAREA where sql_id = :sql_id

-- Probably not
