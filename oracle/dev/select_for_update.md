---
title: 'Select FOR UPDATE locks'
---
```sql
SELECT <columns>
FROM <table>
WHERE <conditions>
FOR UPDATE <wait>;
```

Options:
```sql
-- wait forever
FOR UPDATE;

-- no wait, fail immediately
FOR UPDATE NOWAIT;

-- wait 10 seconds
FOR UPDATE WAIT 10;

-- skip locked rows
FOR UPDATE SKIP LOCKED;
```

Example:

Prepare a table with test data
```sql
CREATE TABLE TEST_LOCK_QUERIES(
  ID  NUMBER,
  NAME  VARCHAR2(64))
/
ALTER TABLE TEST_LOCK_QUERIES
   ADD CONSTRAINT PK_TEST_LOCK_QUERIES PRIMARY KEY (ID);
/
INSERT INTO TEST_LOCK_QUERIES(ID, NAME) VALUES(1, 'Bob')
/
INSERT INTO TEST_LOCK_QUERIES(ID, NAME) VALUES(2, 'Alice')
/
COMMIT
/
```

First session runs
```sql
DECLARE
  num_ID                              NUMBER;
  vch_NAME                            VARCHAR2(64);
BEGIN
  SELECT ID,
         NAME
  INTO   num_ID,
         vch_NAME
  FROM   TEST_LOCK_QUERIES
  WHERE  NAME = 'Bob'
  FOR UPDATE NOWAIT;

  DBMS_LOCK.SLEEP(30);

  UPDATE TEST_LOCK_QUERIES
  SET    NAME = 'Vincent'
  WHERE  ID = num_ID;

  UPDATE TEST_LOCK_QUERIES
  SET    NAME = 'Bob'
  WHERE  NAME = 'Alice';

  COMMIT;
END;
/
```

Second session runs
```sql
DECLARE
  num_ID                              NUMBER;
  vch_NAME                            VARCHAR2(64);
BEGIN
  SELECT ID,
         NAME
  INTO   num_ID,
         vch_NAME
  FROM   TEST_LOCK_QUERIES
  WHERE  NAME = 'Bob'
  FOR UPDATE WAIT 40;

  RAISE_APPLICATION_ERROR(-20100, 'selected '|| num_ID ||':'||vch_NAME);
END;
/
-- Error report:
-- ORA-20100: selected 2:Bob
-- ORA-06512: на  line 13
```
