---
title: 'Oracle data dictionary'
---
Most of data dictionary views have three options: `USER_`, `ALL_`, `DBA_`.
- `USER_` is scoped to current user.
- `ALL_` has all the objects visible to the current user.
- `DBA_` has everything and a couple of extra columns.

Everything
```sql
select * from ALL_OBJECTS
```

Tables
```sql
select * from ALL_TABLES
```

Columns
```sql
select * from ALL_TAB_COLUMNS where TABLE_NAME = :tname
```

Views
```sql
select * from ALL_VIEWS
```

Indexes
```sql
select * from ALL_INDEXES where TABLE_NAME = :tname
```

Constraints
```sql
select * from ALL_CONSTRAINTS

-- columns used in constraints
select * from ALL_CONS_COLUMNS where CONSTRAINT_NAME = :cname
```

Statistics
```sql
select * from DBA_TAB_STATISTICS
where  table_name= 'ACCOUNTS'

select * from DBA_TAB_COL_STATISTICS
where  table_name= 'ACCOUNTS'
```
