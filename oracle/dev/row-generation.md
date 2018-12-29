---
title: 'Row generation'
---
```sql
SELECT 1       const,
       LEVEL   seq,
       ROWNUM
FROM   DUAL
CONNECT BY LEVEL <= 100;
```
