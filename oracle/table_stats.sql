-- Basic command
BEGIN
  DBMS_STATS.GATHER_TABLE_STATS(
    OWNNAME          => :schema,
    TABNAME          => :table,
    DEGREE           => DBMS_STATS.AUTO_DEGREE,    -- degree of parallelism
    CASCADE          => TRUE,                      -- indexes too
    ESTIMATE_PERCENT => 10,                        -- sample percentage
    NO_INVALIDATE    => FALSE,                     -- invalidate cursors immediately
    METHOD_OPT       => 'FOR ALL COLUMNS SIZE 1'); -- no histograms
END;

-- How to construct method_opt?

-- All including hidden
'FOR ALL COLUMNS'

-- Specified columns
'FOR COLUMNS COL1, COL2, ...'

-- No histogram
'SIZE 1'

-- A histogram with 10 buckets
'SIZE 10'

-- Can use several combined
'FOR COLUMNS COL1 SIZE 1 FOR COLUMNS COL2 SIZE 10'

-- Clear stats for table
exec DBMS_STATS.DELETE_TABLE_STATS(ownname => :schema, tabname => :table);
