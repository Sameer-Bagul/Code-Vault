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

--- having --> GROUP BY HAVING , HAVING works with GROUP BY 
--? Q. department, count having more than 2 worker
--* A. 
SELECT department, COUNT(department) FROM worker GROUP BY department HAVING COUNT department > 2 ;  
