SET SERVEROUTPUT ON;


-- GOTO demonstration
DECLARE
v_counter PLS_INTEGER := 0;
BEGIN
<<start_loop>>
v_counter := v_counter + 1;
IF v_counter = 2 THEN
GOTO skip_print;
END IF;


DBMS_OUTPUT.PUT_LINE('Iteration: ' || v_counter || ' (normal print)');


<<skip_print>>
IF v_counter < 4 THEN
DBMS_OUTPUT.PUT_LINE('Iteration: ' || v_counter || ' (after label)');
END IF;


IF v_counter < 4 THEN
GOTO start_loop; -- loop back
END IF;
END;
/
