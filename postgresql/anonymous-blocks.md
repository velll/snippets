---
title: 'Anonymous blocks'
---
`DO` starts an anonymous block, silly `$$` are mandatory.
```sql
DO $$
DECLARE str TEXT;
BEGIN
  WITH names AS (
    SELECT 1      AS ID,
           'Tom'  AS NAME
    UNION ALL
    SELECT 2,
           'Jane')
  SELECT name
  INTO   str
  FROM   NAMES
  WHERE  id = 1;

  RAISE EXCEPTION 'found row with name %', str;
END $$;
```
