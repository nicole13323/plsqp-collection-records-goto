SET SERVEROUTPUT ON;


-- Table-based record example
DECLARE
emp_rec employees%ROWTYPE;
BEGIN
BEGIN
SELECT * INTO emp_rec FROM employees WHERE employee_id = 100;
DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_rec.first_name || ' ' || emp_rec.last_name || ' Salary: ' || emp_rec.salary);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('No employee with id 100');
END;
END;
/


-- User-defined record example
DECLARE
TYPE employee_rec_t IS RECORD (
emp_id NUMBER,
emp_name VARCHAR2(100),
salary NUMBER
);
e employee_rec_t;
BEGIN
e.emp_id := 201;
e.emp_name := 'Test User';
e.salary := 4500;
DBMS_OUTPUT.PUT_LINE('Employee: ' || e.emp_id || ' - ' || e.emp_name || ' - ' || e.salary);
END;
/


-- Cursor-based record example
DECLARE
CURSOR c_emp IS SELECT employee_id, first_name, salary FROM employees ORDER BY employee_id;
r c_emp%ROWTYPE;
BEGIN
OPEN c_emp;
LOOP
FETCH c_emp INTO r;
EXIT WHEN c_emp%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('ID=' || r.employee_id || ' Name=' || r.first_name || ' Salary=' || r.salary);
END LOOP;
CLOSE c_emp;
END;
/
