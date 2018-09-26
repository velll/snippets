-- 10 queries using most Sort Area
select * from (
  select s.sid,
         s.status,
         s.sql_hash_value      sesshash,
         u.SQLHASH             sorthash,
         s.username,
         u.tablespace,
         sum(u.blocks*p.value/1024/1024)         mbused,
         sum(u.extents)                          noexts,
         nvl(s.module,s.program)                 proginfo,
         floor(last_call_et / 3600) || ':' ||
           floor(mod(last_call_et, 3600) / 60) || ':' ||
           mod(mod(last_call_et, 3600), 60)      lastcallet
  from v$sort_usage  u,
       v$session     s,
       v$parameter   p
  where u.session_addr = s.saddr
  and   p.name = 'db_block_size'
  group by s.sid,
           s.status,
           s.sql_hash_value,
           u.sqlhash,
           s.username,
           u.tablespace,
           nvl(s.module,s.program),
           floor(last_call_et / 3600) || ':' ||
             floor(mod(last_call_et, 3600) / 60) || ':' ||
             mod(mod(last_call_et, 3600), 60)
  order by mbused desc,
           sesshash)
where rownum <= 10;

-- Sort Area usage in GBs
SELECT *
FROM (
    SELECT   S.sid || ',' || S.serial#                         sid_serial,
             S.username,
             T.blocks * TBS.block_size / 1024 / 1024 / 1024    gb_used,
             T.tablespace,
             T.sqladdr                                         address,
             Q.hash_value,
             Q.sql_text
    FROM     v$sort_usage    T,
             v$session       S,
             v$sqlarea       Q,
             dba_tablespaces TBS
    WHERE    T.session_addr = S.saddr
    AND      T.sqladdr = Q.address (+)
    AND      T.tablespace = TBS.tablespace_name
    ORDER BY S.sid)
ORDER BY GB_USED DESC;
