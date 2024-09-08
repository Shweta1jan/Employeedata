Use Sample;
Create Table DepartmentT (
Department_no Int Primary key,
Department_Name Varchar(50),
Location Varchar(50)
);
Select *
From DepartmentT 
Create Table EmployeeT ( 
Emp_No Int Primary Key,
Emp_fname Varchar(50),
Emp_lname Varchar(50),
Department_no Int,
Foreign Key (Department_no) References DepartmentT (Department_no)
);
Select *
From DepartmentT
Create Table ProjectT (
Project_no Varchar(10) Primary key,
Project_name Varchar(50),
Budget Decimal(10,2)
);
Select *
From ProjectT
Create Table Works_on
(Emp_No Int, 
Project_no Varchar(10),
Job Varchar(50),
Enter_Date Date,
Foreign Key (Emp_No) References EmployeeT(Emp_No),
Foreign Key (Project_no) References ProjectT (Project_no)
);
INSERT INTO departmentT(Department_no, Department_Name, location) 
VALUES
(1, 'HR', 'Delhi'),
(2, 'IT', 'Mumbai'),
(3, 'Finance', 'Chennai');
INSERT INTO employeeT(emp_no, emp_fname, emp_lname, Department_no) 
VALUES
(10001, 'John', 'Doe', 1),
(10002, 'Jane', 'Smith', 2),
(10003, 'Michael', 'Brown', 2),
(10004, 'Emily', 'Davis', 3),
(10005, 'Chris', 'Wilson', 1);
Select *
From EmployeeT
INSERT INTO ProjectT(project_no, project_name, budget) VALUES
('p1', 'Project Alpha', 100000),
('p2', 'Project Beta', 150000),
('p3', 'Project Gamma', 200000);

INSERT INTO works_on (emp_no, project_no, job, enter_date) 
VALUES
(10001, 'p1', 'Analyst', '2016-01-15'),
(10002, 'p2', 'Clerk', '2017-03-22'),
(10003, 'p1', 'Manager', '2018-07-30'),
(10004, 'p2', 'Developer', '2019-10-05'),
(10005, 'p2', NULL, '2020-05-18');
SELECT *
fROM Works_on ;
Select emp_no 
From Works_on
Where Job = 'Clerk';
Select emp_no 
From Works_on
Where Project_no = 'p2' AND Emp_No < 10005;
Select Emp_No
From Works_on
Where Year(Enter_Date) <> 2017 ;
Select *
From works_on
Where Project_no = 'p1' And  Job In ('Analyst','Manager');
Select *
From Works_on
Where Project_no = 'p2' And Job Is NULL;
Select emp_no,Emp_fname,Emp_lname
From EmployeeT
where Emp_fname Like '%a%';
Select *
From EmployeeT Emp;
Select *
From DepartmentT
Select Emp_No
From EmployeeT Emp Join DepartmentT Dep On Emp.Department_no = Dep.Department_no 
Where Location = 'Delhi';
Select department_no,Count(*)As Emp_Count 
From EmployeeT
Group By Department_no;
Select Department_no,min(emp_no) as min_empno,Max(emp_no) as Max_empno
From EmployeeT
Group by department_no;
Select project_no, count(*) As employee_count
From Works_on
Group by Project_no
Having Count(*) >2;