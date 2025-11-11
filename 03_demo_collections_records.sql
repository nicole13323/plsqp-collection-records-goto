SET SERVEROUTPUT ON;


DECLARE
-- VARRAY type for storing past salaries
TYPE salary_varr IS VARRAY(4) OF NUMBER;


-- User-defined record containing a collection
TYPE emp_with_salaries_t IS RECORD (
employee_id NUMBER,
emp_name VARCHAR2(100),
salaries salary_varr
);


-- Collection of records: associate employee_id -> record
TYPE emp_assoc_t IS TABLE OF emp_with_salaries_t INDEX BY PLS_INTEGER;
emp_store emp_assoc_t;


-- Associative array mapping id -> average salary (quick lookup)
TYPE avg_map_t IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
avg_by_emp avg_map_t;


idx PLS_INTEGER := 0;
BEGIN
-- populate two employee entries
idx := idx + 1;
emp_store(idx).employee_id := 101;
emp_store(idx).emp_name := 'John Doe';
emp_store(idx).salaries := salary_varr(5000, 5200, 5400);


idx := idx + 1;
emp_store(idx).employee_id := 102;
emp_store(idx).emp_name := 'Mary Karekezi';
emp_store(idx).salaries := salary_varr(6000, 6200);


-- compute averages, store in associative array
FOR i IN 1 .. idx LOOP
DECLARE
s_total NUMBER := 0;
BEGIN
FOR j IN 1 .. emp_store(i).salaries.COUNT LOOP
s_total := s_total + emp_store(i).salaries(j);
END LOOP;
avg_by_emp(emp_store(i).employee_id) := s_total / emp_store(i).salaries.COUNT;
DBMS_OUTPUT.PUT_LINE(emp_store(i).emp_name || ' avg = ' || TO_CHAR(avg_by_emp(emp_store(i).employee_id)));
END;
END LOOP;


-- quick lookup example
DBMS_OUTPUT.PUT_LINE('Average salary for employee 101 = ' || avg_by_emp(101));
END;
/
