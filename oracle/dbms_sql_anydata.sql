CREATE TABLE TT_VALUES (
  N_VALUE_1  NUMBER,
  VC_VALUE_1 VARCHAR2(1000)
);

DECLARE
  atb   ANYDATA_TABLE := ANYDATA_TABLE(ANYDATA.ConvertNumber(7), ANYDATA.ConvertVarchar2('asbf'));

  cur      INTEGER;
  res      INTEGER;  -- Ignore result for insert query

  cl_QUERY    CLOB := '
    BEGIN
      INSERT INTO TT_VALUES(
        N_VALUE_1,
        VC_VALUE_1)
      VALUES (
        :1,
        :2);
    END;';
BEGIN
  cur := dbms_sql.open_cursor;

  DBMS_SQL.PARSE(
    cur,
    cl_Query,
    DBMS_SQL.NATIVE);

  FOR i IN 1..atb.COUNT
  LOOP
    CASE atb(i).GETTYPENAME
      WHEN 'SYS.NUMBER'   THEN DBMS_SQL.BIND_VARIABLE(cur, TO_CHAR(i),  ANYDATA.AccessNumber(atb(i)));
      WHEN 'SYS.VARCHAR2' THEN DBMS_SQL.BIND_VARIABLE(cur, TO_CHAR(i),  ANYDATA.AccessVarchar2(atb(i)));
    END CASE;
  END LOOP;

  res := DBMS_SQL.EXECUTE(cur);

  DBMS_SQL.CLOSE_CURSOR(cur);
END;

-- Check
select n_value_1, vc_value_1 from tt_values;

rollback;
