---
title: 'Data dictionary'
---
List tables
```sql
SELECT * FROM pg_catalog.pg_tables;
```

List indexes (keep in mind the table names are downcase by default)
```sql
SELECT * FROM pg_catalog.pg_indexes WHERE tablename = 'some_table'
```

List views (aren't included in a list of tables)
```sql
SELECT * FROM pg_catalog.pg_views;
```

Columns
```sql
SELECT *
FROM   information_schema.columns
WHERE  table_schema = 'some_schema'
AND    table_name   = 'some_table';
```

Constraints
```sql
SELECT *
FROM   information_schema.table_constraints
WHERE  table_schema = 'some_schema'
AND    table_name   = 'some_table'
```
