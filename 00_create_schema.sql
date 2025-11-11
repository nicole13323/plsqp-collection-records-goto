-- Create a simple employees table to support %ROWTYPE and cursor examples
CREATE TABLE employees (
employee_id NUMBER PRIMARY KEY,
first_name VARCHAR2(50),
last_name VARCHAR2(50),
department_id NUMBER,
salary NUMBER
);


-- Sample seed data
INSERT INTO employees(employee_id, first_name, last_name, department_id, salary) VALUES (100, 'Alice', 'Amahoro', 1, 5000);
INSERT INTO employees(employee_id, first_name, last_name, department_id, salary) VALUES (101, 'John', 'Doe', 1, 5200);
INSERT INTO employees(employee_id, first_name, last_name, department_id, salary) VALUES (102, 'Mary', 'Karekezi', 2, 6000);
INSERT INTO employees(employee_id, first_name, last_name, department_id, salary) VALUES (103, 'Paul', 'Ndayishimiye', 2, 7000);
COMMIT;
