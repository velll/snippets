---
title: 'Basic commands'
---
Login
```bash
$ psql -U <username>
```

List databases (after logged in)
```
\l
```

Quit psql
```
\q
```

Connect to a database
```
\c <db>
```

Show current db
```sql
SELECT current_database();
```

List schemas
```
\dn
```

# Tables

List tables
```
\dt *
```

Get table definition
```
\d <table>
```

Get even more about a table
```
\d+ <table>
```

# Other objects
List functions
```
\df
```

List indexes
```
\di
```

List data types (useless without +)
```
\dT+
```

List views
```
\dv
```
