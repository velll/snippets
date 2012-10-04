-- Temporary tables in Oracle persist
-- but you can only access data from your own session

CRATE GLOBAL TEMPORARY TABLE TEMP_TABLE_NAME_DEL(
  ID   NUMBER /*,
  ... -- columns */
)
ON COMMIT DELETE ROWS;

-- If you want rows to stick around after transaction is committed

CRATE GLOBAL TEMPORARY TABLE TEMP_TABLE_NAME_KEEP(
  ID   NUMBER /*,
  ... -- columns */
)
ON COMMIT PRESERVE ROWS;
