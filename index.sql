


CREATE DATABASE company_db ;







CREATE TABLE employees (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(15,2),
    manager_id INT ,
    city VARCHAR(30)



);






INSERT INTO employees VALUES
(DEFAULT, "Noor","HR",50000,3,"Beirut"),
(DEFAULT, "hassan","IT",60000,4,"Baalback"),
(DEFAULT, "Hady","HR",70000,NULL,"Beirut"),
(DEFAULT, "ALi","IT",80000,NULL,"tripoli"),
(DEFAULT, "Mohammad","Sales",45000,6,"saida"),
(DEFAULT, "Zayn","sales",65000,NULL,"Beqaa")

;





SELECT department

FROM `employees` WHERE 1 
GROUP BY department;






SELECT emp_name ,salary ,department
FROM employees
WHERE salary >50000 AND  department IN("HR","IT")




;






this is wrong ------

SELECT emp_name
FROM employees

UNION

SELECT department
FROM employees
WHERE department IN ("HR","IT")

UNION

SELECT salary
FROM employees
WHERE salary>50000

;

------




SELECT emp_name
FROM employees
WHERE emp_name LIKE "H%"

;



SELECT salary

FROM employees 

ORDER BY salary DESC


LIMIT 3
;


SELECT SUM(salary) ,department
FROM employees
WHERE 1
GROUP BY department

;




SELECT SUM(salary) ,department
FROM employees
WHERE 1
GROUP BY department

WITH ROLLUP
;






SELECT emp_name,city
FROM employees
WHERE city="beirut"

UNION 

SELECT emp_name,city
FROM employees
WHERE city="beqaa"

;









SELECT EMP1.emp_name,EMP1.emp_id,EMP1.emp_id , EMP2.emp_name AS "MANAGER"


FROM employees AS EMP1 INNER JOIN employees AS EMP2
ON EMP1.manager_id=EMP2.emp_id
;







SELECT emp_name,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
;








CREATE VIEW IT_Employees  AS



SELECT emp_name ,department ,salary 
FROM employees
WHERE department="IT"


;









SELECT * FROM it_employees WHERE 1





DELIMITER $$

CREATE PROCEDURE GetAllEmployees()

BEGIN
SELECT *
FROM employees ;
END$$

DELIMITER ;




CALL GetAllEmployees ();




DELIMITER $$

CREATE PROCEDURE  GetEmployeesByDepartment (IN departmentlocation VARCHAR(50))

BEGIN

SELECT emp_name ,department
FROM employees
WHERE department =departmentlocation;

END$$

DELIMITER ;












DELIMITER $$

CREATE PROCEDURE  GetEmployeesBySalary  (IN prizi DECIMAL(15,2))

BEGIN

SELECT emp_name ,salary
FROM employees
WHERE salary >=prizi;

END$$

DELIMITER ;



CALL GetEmployeesBySalary(79000.00);
















