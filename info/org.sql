------- DDL COMMANDS ON THE DATABASE -------

CREATE DATABASE org; -- Creates a new database named 'org'
SHOW DATABASES; -- Displays all existing databases
USE org; -- Sets the current database context to 'org'

CREATE TABLE worker(
    worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Defines a table 'worker' with specific columns
    first_name CHAR(25),
    last_name CHAR(25),
    salary INT(15),
    joining_date DATETIME,
    department CHAR(25)
);

INSERT INTO worker (worker_id, first_name, last_name, salary, joining_date, department) 
VALUES
(001, 'sameer', 'bagul', '1200000', '14-02-20 09.00.00', 'HR'), -- Inserts data into the 'worker' table
(001, 'yash', 'chavan', '1200000', '14-02-20 09.00.00', 'HR'),
(001, 'sumit', 'chavan', '1200000', '14-02-20 09.00.00', 'HR');

CREATE TABLE bonus (
    worker_ref_id INT, 
    bonus_amount INT(10), 
    bonus_date DATETIME,
    FOREIGN KEY (worker_ref_id) REFERENCES worker(worker_id) ON DELETE CASCADE
); -- Creates a table 'bonus' with foreign key reference to 'worker' table

INSERT INTO bonus (worker_ref_id ,bonus_amount ,bonus_date ) 
VALUES
('001', '2000', '16-02-20'), -- Inserts data into the 'bonus' table
('002', '200', '16-02-20'),
('003', '20', '16-02-20'); 

CREATE TABLE title (
    worker_ref_id INT ,
    worker_title CHAR(25),
    affected_from DATETIME, 
    FOREIGN KEY (worker_id) REFERENCES worker(worker_id) ON DELETE CASCADE
); -- Creates a table 'title' with foreign key reference to 'worker' table

INSERT INTO title (worker_ref_id, worker_title ,affected_from)
VALUES 
('001', 'manager', '2016-02-20 00:00:00'), -- Inserts data into the 'title' table
('002', 'manager', '2016-02-20 00:00:00'),
('003', 'manager', '2016-02-20 00:00:00');

------- DQL COMMANDS ON THE DATABASE -------

--- SELECT ---
SELECT * FROM worker; -- Retrieves all rows from the 'worker' table

SELECT first_name, salary FROM worker; -- Retrieves specific columns from the 'worker' table

SELECT 44 + 11; -- Demonstrates the usage of a dummy table ('DUAL') to perform operations

SELECT LCASE('SAMEER'); -- Applies the lowercase function to the provided string

--- WHERE ---
SELECT * FROM worker WHERE salary > 80000; -- Retrieves rows from 'worker' table based on a condition

--- BETWEEN --- [Range is inclusive] --- [0, 100]
SELECT * FROM worker WHERE salary BETWEEN 80000 AND 300000; -- Retrieves rows within a salary range

--- reduce or statement

SELECT * FROM worker where department = 'HR' OR department = "Admin";
-- better way : IN -- 
SELECT * FROM worker WHERE department IN ('HR', 'Admin');  --- reduces multiple Or 
--- NOT
SELECT * from worker WHERE department NOT IN ('HR', 'Admin');


--- Pattern searching ---
SELECT * FROM worker where first_name LIKE '%i%';


--- Sorting Using ORDER BY ---
SELECT * FROM worker ORDER BY salary;


--- DISTINCT keyword -> to et distinct value from table
SELECT DISTINCT department FROM worker;


--- Data Grouping -> GROUP BY 
SELECT department FROM worker GROUP BY department;

SELECT department, COUNT(department) from worker GROUP BY department; ---> this will 

--? Q. Find avg salary per department.
--* A. SELECT department, AVG(salary) FROM worker GROUP BY department;

-- MIN
SELECT department, MIN(salary) FROM worker GROUP BY department;


-- MAX 
SELECT * department, MIN(salary) FROM worker GROUP BY department;

-- SUM 

SELECT * department, SUM(salary) FROM worker GROUP BY department;

-- HAVING  
-- select + where = filter the distinct / UNGROUPED data
-- GROUP BY + HAVING -> filter the grouped data 

--- having --> GROUP BY HAVING , HAVING works with GROUP BY 
--? Q. department, count having more than 2 worker
--* A. SELECT department, COUNT(department) FROM worker GROUP BY department HAVING COUNT department > 2 ;




------ALTER OPTIONS -------
-- 1. change schema 
-- 2. ADD 
-- MODIFY
-- CHANGE COLUMN
-- DROP COLUMN 
-- RENAME 


CREATE TABLE account (
    id int PRIMARY KEY ,
    name VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0; 
);


-- ADD new COLUMN 
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- MODIFY 
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

-- CHANGE COLUMN -> RENAME THE COLUM 
ALTER TABLE account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE account DROP COLUMN saving_interest;

-- RENAME THE TABLE 
ALTER TABLE account RENAME TO account_details;  





--=============  DML  =============--
-- UPDATE ,DELETE, REPLACE.

--============= JOINS ==============--

-- INNER JOIN  
select C.*, O.* from customer AS C; 
-- LEFT JOIN 
-- RIGHT JOIN
-- FULL JOIN
-- SELF JOIN 


-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
CREATE DATABASE company ;
use company;
CREATE TABLE project(
    id int PRIMARY KEY ,
    emp_id int,
    name VARCHAR(255),
    client_id int
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE employee (
    id int PRIMARY key ,
    fname VARCHAR(255),
    lname VARCHAR(255),
    age int ,
    email_id varchar(255),
    phone_no int ,
    city varchar(255)    
);

CREATE TABLE client(
    id int ,
    first_name varchar(255),
    last_name varchar(255),
    email_id varchar(255),
    phone_no int ,
    city varchar(255),
    emp_id int ,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE
);

-- Lets use the joining concept on the above database.
 -- INNER JOIN 
-- Enlist all the employees ID's, name aalong with Project Allocated to them
SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e INNER JOIN project as p ON e.id = p.emp_id;

-- fetch out all the employee ID's and their contact detail who have have been working from jaipur with clients name working in hyderabad
SELECT e.id, e.email_id, e.phone_no , c.first_name , c.last_name from employee as e INNER JOIN client as c ON  e.id = c.emp_id WHERE e.city = 'jaipur' ANd c.city = 'hydarabad';


-- LEFT JOIN 
-- Fetch out each project allocated to each employee .
SELECT * FROM employee as e 
LEFT JOIN project as p on e.id - p.emp_id;

-- right join
-- List all the projects along with the employee's name and their and respective allocated email id
SELECT p.id , p.name , e.fname, e.lname, e.email_id FROM employee as e 

------------- INNER JOIN without the inne join user name ------------------
SELECT e.id , e.fname, e.lname , p.id , p.name FROM employee as e, project as p WHERE e.id = p.emp_id;



-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--? SET operations on Database
-- union , intersection , minus    
--! syntax :
--* SELECT * FROM table1 UNION SELECT * FROM table2;
