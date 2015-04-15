-- Show space that one table occupies
SELECT pg_size_pretty(pg_total_relation_size('<table_name>'));

-- Show DB space in use
SELECT pg_size_pretty(pg_database_size('<db_name>'));
