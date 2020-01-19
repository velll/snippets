---
title: 'Database links'
---
If new db is on the same domain, only specify the db name in connect string. Specify the full string if it's not.
```sql
create database link <db-link-name> connect to <user> identified by <password> using <connect-string>
```
Usage
```sql
select * from v$database@<db-link-name>
```
