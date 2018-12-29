---
title: 'Autonomous transactions'
---
- Autonomous transaction will not see changes made in main transaction.
- Committing/rolling back autonomous transaction will not affect main transaction.
```sql
PROCEDURE PROC_NAME
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  ...
  COMMIT; -- has to have commit
END;
/
```
