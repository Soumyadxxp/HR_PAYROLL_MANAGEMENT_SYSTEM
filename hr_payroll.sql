create database hr_payroll;
use hr_payroll;

create table departments (
    dept_id int primary key,
    dept_name varchar(50) unique not null,
    location varchar(50));
    
create table employees (
    emp_id int primary key,
    emp_name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15),
    hire_date date not null,
    dept_id int,
    job_role varchar(50),
    constraint fk_dept foreign key (dept_id) references departments(dept_id),
    constraint chk_role check (job_role in ('Developer','Manager','HR','Accountant','Tester')));
    
create table projects (
    project_id int primary key,
    project_name varchar(100) not null,
    start_date date,
    end_date date);

create table employee_projects (
    emp_id int,
    project_id int,
    role varchar(50),
    primary key(emp_id, project_id),
    foreign key(emp_id) references employees(emp_id),
    foreign key (project_id) references projects(project_id));
    
create table salaries (
    salary_id int primary key,
    emp_id int,
    basic_salary decimal(10,2) not null,
    bonus decimal(10,2) default 0,
    deductions decimal(10,2) default 0,
    foreign key (emp_id) references employees(emp_id));
    
create table attendance (
    attendance_id int primary key,
    emp_id int,
    date date,
    status varchar(10) check (status in ('Present','Absent','Leave')),
    foreign key (emp_id) references employees(emp_id));

insert into departments values
(1, 'HR', 'Pune'),
(2, 'Development', 'Pune'),
(3, 'Finance', 'Mumbai'),
(4, 'QA', 'Pune'),
(5, 'Management', 'Mumbai');

insert into employees values
(101, 'Amit Sharma','amit@company.com','9876543210','2022-01-10',2,'Developer'),
(102, 'Priya Singh','priya@company.com','9922334455','2021-03-15',1,'HR'),
(103, 'Rahul Verma','rahul@company.com','8811223344','2020-07-22',2,'Manager'),
(104, 'Neha Joshi','neha@company.com','9988776655','2023-02-10',4,'Tester'),
(105, 'Karan Patel','karan@company.com','9090909090','2019-11-01',3,'Accountant'),
(106, 'Sonia Mehta','sonia@company.com','8899001122','2021-04-19',2,'Developer');

insert into projects values
(1,'Payroll System','2023-01-01','2023-06-30'),
(2,'E-Commerce Portal','2023-02-01','2023-09-30'),
(3,'Mobile App','2023-03-15','2023-12-31');

insert into employee_projects values
(101,1,'Developer'),
(101,2,'Developer'),
(102,1,'HR Support'),
(103,2,'Manager'),
(106,3,'Developer'),
(104,2,'Tester');

insert into salaries values
(1,101,60000,5000,2000),
(2,102,45000,3000,1000),
(3,103,80000,7000,5000),
(4,104,40000,2000,500),
(5,105,55000,4000,1500),
(6,106,62000,6000,2500);

insert into attendance values
(1,101,'2023-12-01','Present'),
(2,102,'2023-12-01','Absent'),
(3,103,'2023-12-01','Present'),
(4,104,'2023-12-01','Leave'),
(5,105,'2023-12-01','Present'),
(6,106,'2023-12-01','Present');

select * from employees;

select emp_id, emp_name from employees where hire_date > "2021-12-31";

select emp_id, emp_name from employees where job_role = "HR";

select employees.emp_id, employees.emp_name, salaries.basic_salary from employees 
	join salaries on employees.emp_id = salaries.emp_id
	where salaries.basic_salary > 50000;
    
select emp_id, emp_name, hire_date from employees order by hire_date;

select emp_id, emp_name, dept_id from employees where dept_id != 2;

select departments.dept_name, count(employees.emp_id) as total_employees from departments 
	left join employees on departments.dept_id = employees.dept_id
	group by departments.dept_name;
    
select avg(salaries.basic_salary) as avg_developer_salary from employees 
	join salaries on employees.emp_id = salaries.emp_id
	where employees.job_role = 'Developer';

select max(basic_salary) as max_salary from salaries;

select departments.dept_name, avg(salaries.basic_salary) as avg_salary from departments 
	join employees on departments.dept_id = employees.dept_id
	join salaries on employees.emp_id = salaries.emp_id
	group by departments.dept_name;

select departments.dept_name, count(employees.emp_id) as total_employees from departments 
	join employees on departments.dept_id = employees.dept_id
	group by departments.dept_name
	having count(employees.emp_id) > 2;

select employees.emp_id, employees.emp_name, departments.dept_name from employees
	join departments on employees.dept_id = departments.dept_id;
    
select employees.emp_id, employees.emp_name,
       salaries.basic_salary, salaries.bonus, salaries.deductions
		from employees join salaries on employees.emp_id = salaries.emp_id;

select projects.project_name, employees.emp_name, employee_projects.role
	from projects join employee_projects
	on projects.project_id = employee_projects.project_id
	join employees on employee_projects.emp_id = employees.emp_id;
    
select departments.dept_name, employees.emp_id from employees
	right join departments on employees.dept_id = departments.dept_id
	where employees.emp_id is null;

select employees.emp_id, employees.emp_name, departments.dept_name from employees
	left join departments on employees.dept_id = departments.dept_id
	union
select employees.emp_id, employees.emp_name, departments.dept_name from employees
	right join departments on employees.dept_id = departments.dept_id;
    
select employees.emp_id, employees.emp_name, salaries.basic_salary from employees 
	join salaries on employees.emp_id = salaries.emp_id
	where salaries.basic_salary > (select avg(basic_salary) from salaries);
    
select employees.emp_id, employees.emp_name, salaries.basic_salary from employees 
	join salaries on employees.emp_id = salaries.emp_id
	where salaries.basic_salary = (select max(basic_salary) from salaries);

select emp_id, emp_name from employees
	where emp_id not in (select emp_id from employee_projects);
    
select max(basic_salary) as second_highest_salary from salaries
	where basic_salary < (select max(basic_salary) from salaries);

select project_id, project_name from projects
	where project_id in (select project_id from employee_projects
    group by project_id having count(emp_id) > 2);
    
select departments.dept_name from departments
	join employees on departments.dept_id = employees.dept_id
	join salaries on employees.emp_id = salaries.emp_id
	group by departments.dept_name
	having avg(salaries.basic_salary) > (select avg(s.basic_salary) from employees e
         join salaries s on e.emp_id = s.emp_id
         join departments d on e.dept_id = d.dept_id where d.dept_name = "Finance");
         
select employees.emp_id, employees.emp_name,
       (salaries.basic_salary + salaries.bonus - salaries.deductions) as total_payroll
	from employees join salaries on employees.emp_id = salaries.emp_id;
    
select employees.emp_id, employees.emp_name,
       salaries.basic_salary,
       rank() over (order by salaries.basic_salary desc) as salary_rank from employees
		join salaries on employees.emp_id = salaries.emp_id;
        
select date_format(date, '%Y-%m') as month, status,
    count(*) as total_days from attendance
	group by date_format(date, '%Y-%m'), status order by month;
    
create view high_earners as select emp_id, basic_salary from salaries
where basic_salary > 60000;
select * from high_earners;

create view dept_salary_summary as select d.dept_name, avg(s.basic_salary) as avg_salary
from employees e
join salaries s on e.emp_id = s.emp_id
join departments d on d.dept_id = e.dept_id
group by d.dept_name;
select * from dept_salary_summary;

create view employee_project_view as select e.emp_name, p.project_name, ep.role from employees e
join employee_projects ep on e.emp_id = ep.emp_id
join projects p on p.project_id = ep.project_id;
select * from employee_project_view;

create view employee_full_profile as select 
    e.emp_id,
    e.emp_name,
    e.job_role,
    d.dept_name,
    s.basic_salary,
    s.bonus,
    s.deductions from employees e
	join departments d on e.dept_id = d.dept_id
	join salaries s on e.emp_id = s.emp_id;
select * from employee_full_profile;

create view employees_without_projects as select e.emp_id, e.emp_name from employees e
	left join employee_projects ep on e.emp_id = ep.emp_id
	where ep.project_id is null;
select * from employees_without_projects;

create view monthly_attendance_summary as select 
    emp_id, date_format(date, '%Y-%m') as month,
    status, count(*) as total_days from attendance
	group by emp_id, date_format(date, '%Y-%m'), status;
select * from monthly_attendance_summary;

set SQL_SAFE_UPDATES=0;

update salaries set basic_salary = 65000 where emp_id = 101;
select * from salaries;

delete from attendance where status = "Absent";
select * from attendance;

insert into projects (project_id, project_name, start_date, end_date)
	values (4, "AI Chatbot System", "2024-01-01", "2024-08-31");
select * from projects;

update employees set dept_id = 4 where emp_id = 106;
select * from employees;

create index idx_employee_email on employees(email);

alter table salaries add constraint chk_min_salary check (basic_salary >= 18000);

select * from employees where phone is null;

select sum(basic_salary + bonus - deductions) as total_company_payroll from salaries;

select e.emp_id, e.emp_name, count(ep.project_id) as project_count from employees e
	join employee_projects ep on e.emp_id = ep.emp_id
	group by e.emp_id, e.emp_name
	having count(ep.project_id) = (select max(project_count)
    from (select count(project_id) as project_count
	from employee_projects group by emp_id) as temp);
    
select d.dept_name, count(e.emp_id) as emp_count from departments d
	join employees e on d.dept_id = e.dept_id
	group by d.dept_name order by emp_count desc limit 1;
    
select p.project_name, count(ep.emp_id) as emp_count from projects p
	left join employee_projects ep
	on p.project_id = ep.project_id
	group by p.project_id, p.project_name
	order by emp_count asc limit 1;
    
select e.emp_id, e.emp_name from employees e
join attendance a on e.emp_id = a.emp_id
group by e.emp_id, e.emp_name
having sum(case when a.status <> "Present" then 1 else 0 end) = 0;