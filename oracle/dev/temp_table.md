---
title: 'Temporary tables'
---
Temporary tables in Oracle are persistent but you can only access data from your own session
```sql
CRATE GLOBAL TEMPORARY TABLE TEMP_TABLE_NAME_DEL(
  ID   NUMBER /*,
  ... -- columns */
)
ON COMMIT DELETE ROWS;
```

Or if you want rows to stick around after transaction is committed
```sql
CRATE GLOBAL TEMPORARY TABLE TEMP_TABLE_NAME_KEEP(
  ID   NUMBER /*,
  ... -- columns */
)
ON COMMIT PRESERVE ROWS;
```
