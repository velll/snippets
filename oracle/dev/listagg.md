---
title: 'Listagg — collecting string results'
---
Oracle 11G
```sql
SELECT LISTAGG(COLUMN_NAME, ', ')
       WITHIN GROUP (ORDER BY COLUMN_ID) COLS
FROM all_tab_columns
where table_name like :table_name
```

Oracle 10 — undocumented
```sql
SELECT WM_CONCAT(COLUMN_NAME) COLS
FROM all_tab_columns
where table_name like :table_name
```
