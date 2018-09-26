-- 11G
SELECT LISTAGG(COLUMN_NAME, ', ')
       WITHIN GROUP (ORDER BY COLUMN_ID) COLS
FROM all_tab_columns
where table_name like :table_name

-- 10
-- недокументированная =(
SELECT WM_CONCAT(COLUMN_NAME) COLS
FROM all_tab_columns
where table_name like :table_name
