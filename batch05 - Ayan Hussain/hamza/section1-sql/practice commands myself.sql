-- List down existing DB

exec sp_databases;
select * from sys.databases;

select name from sys.databases;


-- Creating a DB
CREATE DATABASE school_db
CREATE DATABASE demo
create database fashion_clothing_shop_db;

USE school_db;
select DB_NAME();

-- Deleting a DB
DROP DATABASE demo;

-- Creating a Table
use fashion_clothing_shop_db;

create table low_category_clothes(
	product_id int identity(1, 1),
	product_name varchar(50) not null,
	product_price decimal(10, 2)  not null ,
	avaiable_stock int not null
);

SET IDENTITY_INSERT low_category_clothes ON;

INSERT INTO low_category_clothes
(product_id, product_name, product_price, avaiable_stock)
VALUES
(1, 'polo t-shirt', 1300, 29),
(2, 'Zara t-shirt', 1300, 28),
(3, 'Addidas t-shirt', 1300, 22),
(4, 'Uniworth', 3300, 19),
(5, 'Charcoal Clothing', 1800, 60),
(6, 'Leisure Club', 3000, 30),
(7, 'Breakout', 1900, 59),
(8, 'Cougar', 3200, 400),
(9, 'Sapphire', 4300, 9);


-- Reading data
select * from students;
select * from students where student_id = 3;
select student_name from students;


-- Updating data
UPDATE students SET grade = 12 WHERE student_id = 103;

-- Delete data
delete from students where student_id = 3;

DELETE FROM students
WHERE 1=1;

select * from students;

--- TRUNCATE ----
TRUNCATE table students

-- Task: Creating Employee Table ----
CREATE DATABASE bank_db;
USE bank_db;



create table employee(
	emp_id int identity(101, 1) primary key,
	fname varchar(50) not null, 
	lname varchar(50) not null, 
	email varchar(50) not null unique, 
	job_title varchar(50) not null, 
	department varchar(50), 
	salary decimal(10, 2) not null default 30000, 
	hire_date DATE not null default convert(DATE, getdate()), 
	city varchar(50)
)

EXEC sp_help 'employee'


INSERT INTO employee
(fname, lname, email, job_title, department, salary, hire_date, city)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Director', 'Management', 180000, '2019-02-10', 'Mumbai'),
('Diya', 'Patel', 'diya.patel@example.com', 'Lead Engineer', 'Tech', 120000, '2020-08-15', 'Bengaluru'),
('Rohan', 'Mehra', 'rohan.mehra@example.com', 'Software Engineer', 'Tech', 85000, '2022-05-20', 'Bengaluru'),
('Priya', 'Singh', 'priya.singh@example.com', 'HR Manager', 'Human Resources', 95000, '2019-11-05', 'Mumbai'),
('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Data Scientist', 'Tech', 110000, '2021-07-12', 'Hyderabad'),
('Ananya', 'Gupta', 'ananya.gupta@example.com', 'Marketing Lead', 'Marketing', 90000, '2020-03-01', 'Delhi'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', 'Sales Executive', 'Sales', 75000, '2023-01-30', 'Mumbai'),
('Sameera', 'Rao', 'sameera.rao@example.com', 'Software Engineer', 'Tech', 88000, '2023-06-25', 'Pune'),
('Ishaan', 'Verma', 'ishaan.verma@example.com', 'Recruiter', 'Human Resources', 65000, '2022-09-01', 'Mumbai'),
('Kavya', 'Joshi', 'kavya.joshi@example.com', 'Product Designer', 'Design', 92000, '2021-04-18', 'Bengaluru'),
('Zain', 'Khan', 'zain.khan@example.com', 'Sales Manager', 'Sales', 115000, '2019-09-14', 'Delhi'),
('Nisha', 'Desai', 'nisha.desai@example.com', 'Jr. Data Analyst', 'Tech', 70000, '2024-02-01', 'Hyderabad'),
('Aditya', 'Nair', 'aditya.nair@example.com', 'Marketing Analyst', 'Marketing', 68000, '2022-10-10', 'Delhi'),
('Fatima', 'Ali', 'fatima.ali@example.com', 'Sales Executive', 'Sales', 78000, '2022-11-22', 'Mumbai'),
('Kabir', 'Shah', 'kabir.shah@example.com', 'DevOps Engineer', 'Tech', 105000, '2020-12-01', 'Pune');


select * from employee;

INSERT INTO employee
(fname, lname, email, job_title, department, city)
VALUES
(null, 'Verma', 'null.verma@example.com', 'Director', 'Management', 'Mumbai');

select * from employee;

-- WHERE Clause ---
select * from employee where emp_id = 111;
select * from employee where department != 'Sales';
select * from employee where salary = 100000;
select * from employee where hire_date > '2021-04-18';


-- DISTINCT ----
select distinct city from employee ;

-- ORDER BY ---
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY hire_date; 
SELECT * FROM employee ORDER BY fname DESC;
SELECT department, fname FROM employee ORDER BY department, fname;

--- LIKE -----
select * from employee where department like 'Man%';
SELECT * FROM employee WHERE fname LIKE '[ABCDE]%';
SELECT * FROM employee WHERE fname LIKE '[^A]%';
SELECT * FROM employee WHERE fname LIKE '_a%';
SELECT * FROM employee WHERE fname LIKE '____';
SELECT * FROM employee WHERE email LIKE '%gupta%';

----- TOP -----
SELECT TOP 3 * FROM employee ORDER BY salary DESC;

--- Logical Operators ---
SELECT * FROM employee WHERE salary=75000 AND department='Sales' 
SELECT * FROM employee WHERE salary=75000 OR department='Sales' OR city='Mumbai';
SELECT * FROM employee WHERE department NOT IN ('Tech', 'Sales', 'Management');
SELECT * FROM employee WHERE salary BETWEEN 75000 AND 100000;

--- Aggregate Functions ----
SELECT COUNT(emp_id) FROM employee;
SELECT MIN(salary) FROM employee;
SELECT MAX(salary) FROM employee;
SELECT AVG(salary) FROM employee;
SELECT SUM(salary) FROM employee;

--- GROUP BY ----
SELECT department, COUNT(emp_id) as count FROM employee GROUP BY department;
SELECT department, SUM(salary) as count FROM employee GROUP BY department;
SELECT department, AVG(salary) as count FROM employee GROUP BY department;

SELECT city, COUNT(emp_id) FROM employee GROUP BY city;

SELECT department, city, COUNT(emp_id) FROM employee GROUP BY department, city 
ORDER BY department;

--- HAVING Clause ---
SELECT department, COUNT(emp_id) as count  FROM employee GROUP BY department 
HAVING COUNT(emp_id) > 2; 

SELECT job_title, AVG(salary) FROM employee GROUP BY job_title
HAVING AVG(salary) > 90000;

SELECT department, SUM(salary) as total FROM employee GROUP BY department 
HAVING SUM(salary) > 200000;


---- GROUP BY ROLLUP ----
SELECT department, COUNT(emp_id) as count FROM employee
GROUP BY ROLLUP(department);

SELECT department, SUM(salary) as count FROM employee
GROUP BY ROLLUP(department);

SELECT department, COALESCE(city,'Total') as city, COUNT(emp_id)
FROM employee GROUP BY ROLLUP(department, city)
ORDER BY department;


SELECT department, COALESCE(city,'Total') as city, COUNT(emp_id)
FROM employee GROUP BY department, city;

SELECT department, COALESCE(city,'Total') as city, COUNT(emp_id)
FROM employee GROUP BY department, city;

