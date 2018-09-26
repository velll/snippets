-- Map OS directory to Oracle directory
CREATE DIRECTORY CSV_TMP_DIR AS '/tmp/csv_files'
/
-- Specify CSV field — every format needs its own table
CREATE TABLE EX_CSV_TABLE(
  ID             NUMBER,
  NAME           VARCHAR2(100),
  WHATEVER       VARCHAR2(1000))
ORGANIZATION EXTERNAL(
TYPE ORACLE_LOADER
DEFAULT DIRECTORY CSV_TMP_DIR
ACCESS PARAMETERS (
  records delimited BY newline
  badfile CSV_TMP_DIR:'ex_csv_table.bad'
  fields terminated BY ';'
  optionally enclosed BY '"'
  lrtrim
  missing field VALUES are NULL(WHATEVER))
LOCATION ('ex_csv_table_data.csv'))
REJECT LIMIT UNLIMITED
/
