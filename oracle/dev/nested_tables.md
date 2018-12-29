---
title: 'Nested tables'
---
```sql
create type varchar2_500_table as table of varchar2(500)
/
create type varchar2_500_table_2 as table of varchar2(500)
/
create table tab1 (
  id   number,
  vch  varchar2(500),
  nt   varchar2_500_table)
nested table nt store as tab1_nt
/
create table tab2 (
  id   number,
  vch  varchar2(500),
  nt   varchar2_500_table_2)
nested table nt store as tab2_nt
/
insert into tab1 values(1, 'a', varchar2_500_table('first', 'last'))
/
insert into tab2
select id,
       vch,
       nt
from tab1
/
-- несовместимые типы данных: ожидается -, получено AIS_NET.VARCHAR2_500_TABLE
insert into tab2
select id,
       vch,
       CAST(nt AS varchar2_500_table_2)
from tab1
/
```
