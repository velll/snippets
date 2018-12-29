---
title: 'Drop all tables in a schema'
---
```sql
BEGIN
  FOR rl_Tbl IN (
    SELECT *
    FROM   ALL_TABLES
    WHERE  OWNER = :schema)
  LOOP
    EXECUTE IMMEDIATE '
     DROP TABLE '|| :schema || '.' || rl_Tbl.TABLE_NAME;
  END LOOP;
END;
/
```
