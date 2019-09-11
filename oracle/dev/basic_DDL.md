---
title: 'Basic DDL'
layout: 'page'
categories: ["oracle_dev"]
---
## Tables
```sql
CREATE TABLE TABLE_NAME(
  ID                   NUMBER,
  MANDATORY_FK_COLUMN  NUMBER NOT NULL,
  FOREIGN_KEY_COLUMN   NUMBER,
  NUMBER_COLUMN        NUMBER,
  STRING_COLUMN        VARCHAR2(500),
  DATE_TIME_COLUMN     DATE);
```

Add columns
```sql
alter table TABLE_NAME add (
  SOME_COLUMN      NUMBER,
  ANOTHER_COLUMN   DATE)
```

Renaming
```sql
-- Table
RENAME TABLE TABLE_NAME TO NEW_TABLE_NAME;
-- Column
alter table TABLE_NAME rename column OLD_NAME TO NEW_NAME;
```

## Constraints
Primary key
```sql
alter table TABLE_NAME
  add constraint PK_TABLE_NAME primary key (ID);
```
Foreign key
```sql
CREATE TABLE PARENT_TABLE_NAME(
  ID                   NUMBER,
  ...
)

ALTER TABLE TABLE_NAME
  ADD CONSTRAINT FK_TABLE_NAME_KEY foreign key (FOREIGN_KEY_COLUMN) REFERENCES PARENT_TABLE (ID) ON DELETE SET NULL ENABLE
```

## Indexes

Simple index
```sql
create index TABLE_NAME_FK_IDX on TABLE_NAME(
  MANDATORY_FK_COLUMN asc)
tablespace tablespace_name

drop index TABLE_NAME_FK_IDX
```

Multi column index
```sql
create index TABLE_NAME_FK_IDX on TABLE_NAME(
  MANDATORY_FK_COLUMN asc,
  NUMBER_COLUMN       asc)
tablespace tablespace_name;

drop index TABLE_NAME_FK_IDX
```

Functional index
```sql
create index TABLE_NAME_FK_IDX on TABLE_NAME(
  UPPER(STRING_COLUMN) asc)
tablespace tablespace_name;
```

Rebuilding indexes
```sql
alter index INDEX_NAME rebuild
```
