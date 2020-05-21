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
