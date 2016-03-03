-- Normal loop
BEGIN
  <<outer>>
  FOR i IN 1..2 LOOP
    <<inner>>
    FOR j IN 1..2 LOOP
      dbms_output.put_line('In inner loop');
    END LOOP;

    dbms_output.put_line('In outer loop');
  END LOOP;

  dbms_output.put_line('Finished');
END;

/*
In inner loop
In inner loop
In outer loop
In inner loop
In inner loop
In outer loop
Finished
*/

-- Exit prematurely
BEGIN
  <<outer>>
  FOR i IN 1..2 LOOP
    <<inner>>
    FOR j IN 1..2 LOOP
      dbms_output.put_line('In inner loop');
      EXIT;
    END LOOP;

    dbms_output.put_line('In outer loop');
  END LOOP;

  dbms_output.put_line('Finished');
END;

/*
In inner loop
In outer loop
In inner loop
In outer loop
Finished
*/

-- Abort
BEGIN
  <<outer>>
  FOR i IN 1..2 LOOP
    <<inner>>
    FOR j IN 1..2 LOOP
      dbms_output.put_line('In inner loop');
      EXIT outer;
    END LOOP;

    dbms_output.put_line('In outer loop');
  END LOOP;

  dbms_output.put_line('Finished');
END;

/*
In inner loop
Finished
*/
