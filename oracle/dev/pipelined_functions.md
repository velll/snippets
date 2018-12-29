---
title: 'Pipelined functions'
---
Prepare a table
```sql
create table pipelined_table(
  id   number,
  name varchar2(256));
```

Create package
```sql
create or replace package pipelined_package
IS
  type pipeline is table of pipelined_table%rowtype;

  function pipelined_function(
    num_Input                   IN NUMBER)
  RETURN pipeline
  PIPELINED;
END pipelined_package;
/
create or replace package body pipelined_package
IS
  function pipelined_function(
    num_Input                   IN NUMBER)
  RETURN pipeline
  PIPELINED
  IS
    rc_Pipe                     pipelined_table%ROWTYPE;
  BEGIN
    rc_Pipe.id := 1;
    rc_Pipe.name := 'somebody';

    PIPE ROW(rc_Pipe);

    -- NO RETURN;
  END pipelined_function;
END pipelined_package;
/
```
-- Usage
```sql
SELECT *
FROM   TABLE(pipelined_package.pipelined_function(1));
```
