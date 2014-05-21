SELECT 1       CONST,
       s.val   SEQ,
       ROW_NUMBER() OVER(ORDER BY s.val)   RNUM
FROM   generate_series(10, 100) as s(val);
