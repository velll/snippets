---
title: 'Analyzing space'
---
Show space occupied by a table
```sql
SELECT pg_size_pretty(pg_total_relation_size('<table_name>'));
```
Show DB space in use
```sql
SELECT pg_size_pretty(pg_database_size('<db_name>'));
```
