---
title: 'Multiset operators'
---
```sql
CREATE OR REPLACE TYPE VARCHAR_TABLE AS TABLE OF VARCHAR(100)
/
CREATE OR REPLACE PROCEDURE LOG_IT(
  tbl_TBL   VARCHAR_TABLE)
IS
  vch_Log   VARCHAR2(100);
BEGIN
  FOR i IN 1..tbl_TBL.COUNT
  LOOP
    IF i > 1 THEN
      vch_Log := vch_Log || ', ';
    END IF;

    vch_Log := vch_Log || tbl_TBL(i);
  END LOOP;

  dbms_output.put_line(vch_Log);
END LOG_IT;
/
DECLARE
  tbl_Tokens                          VARCHAR_TABLE := VARCHAR_TABLE('New York', 'Kennedy', 'st', '19', 'a');
  tbl_Abbreviations                   VARCHAR_TABLE := VARCHAR_TABLE('st', 'ave', 'sq');
BEGIN
  LOG_IT(tbl_Tokens);
  LOG_IT(tbl_Abbreviations);

  tbl_Tokens := tbl_Tokens MULTISET EXCEPT tbl_Abbreviations;

  LOG_IT(tbl_Tokens);
END;
/
```
