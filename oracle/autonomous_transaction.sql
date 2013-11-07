-- autonomous transaction will not see changes made in main transaction
-- committing/rolling back autonomous transaction will not affect main transaction
PROCEDURE PROC_NAME
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  ...
  COMMIT; -- has to have commit
END;
/
