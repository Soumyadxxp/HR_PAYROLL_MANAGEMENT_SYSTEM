# HR & Payroll Management System

## Overview

The **HR & Payroll Management System** is a MySQL-based database project designed to manage and analyze essential human resource and payroll information within an organization.

The system maintains structured data related to employees, departments, salaries, attendance, projects, and employee project assignments. It demonstrates practical implementation of relational database concepts and SQL operations ranging from basic queries to advanced data analysis.

## Project Objectives

The main objectives of this project are to:

- Design a structured relational database for HR and payroll management.
- Maintain employee and department information.
- Manage employee salary, bonus, and deduction details.
- Track employee attendance.
- Manage projects and employee project assignments.
- Perform payroll and workforce analysis using SQL.
- Apply database constraints to maintain data integrity.
- Use views to simplify frequently required queries.
- Demonstrate practical usage of joins, subqueries, aggregate functions, and window functions.

## Database Structure

The database consists of the following tables:

| Table | Description |
|---|---|
| `departments` | Stores department information and location |
| `employees` | Stores employee personal and employment details |
| `projects` | Stores project information |
| `employee_projects` | Represents the many-to-many relationship between employees and projects |
| `salaries` | Stores employee salary, bonus, and deduction details |
| `attendance` | Stores employee attendance records |

## Entity Relationships

The main relationships in the database are:

- A department can have multiple employees.
- An employee belongs to a department.
- An employee can work on multiple projects.
- A project can have multiple employees.
- The `employee_projects` table manages the many-to-many relationship between employees and projects.
- Each salary record is associated with an employee.
- Each attendance record is associated with an employee.

## Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Database Concepts:** Relational Database Management System (RDBMS)
- **Version Control:** Git and GitHub

## SQL Concepts Implemented

This project demonstrates the practical use of:

- Database and table creation
- Primary keys
- Foreign keys
- Unique constraints
- Check constraints
- NOT NULL constraints
- INSERT operations
- UPDATE operations
- DELETE operations
- SELECT queries
- WHERE conditions
- ORDER BY
- Aggregate functions
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN alternative using UNION
- Subqueries
- Nested subqueries
- Window functions
- SQL views
- Indexes
- CASE expressions
- Date functions

## Key Features

### Employee Management

Stores employee information including:

- Employee ID
- Employee name
- Email
- Phone number
- Hire date
- Department
- Job role

### Department Management

Maintains department information including department name and location.

### Payroll Management

Stores and analyzes:

- Basic salary
- Bonus
- Deductions
- Total payroll amount

The total payroll for an employee can be calculated as:

`Basic Salary + Bonus - Deductions`

### Attendance Management

Tracks employee attendance using the following statuses:

- Present
- Absent
- Leave

The project also includes queries for attendance summaries and attendance-based employee analysis.

### Project Management

Stores project information and assigns employees to projects with specific project roles.

## Query Categories

The project contains more than 40 SQL tasks covering the following areas:

1. Basic Queries
2. Filtering and Sorting
3. Aggregate Functions
4. GROUP BY and HAVING
5. Joins
6. Subqueries
7. Nested Subqueries
8. Advanced SQL Queries
9. Views
10. DML Operations
11. Constraints and Indexes
12. Case Study Queries

## Example Analytical Queries

The project includes SQL queries for:

- Finding employees earning more than a specified salary.
- Calculating the average salary of developers.
- Finding the maximum and second-highest salary.
- Calculating the average salary for each department.
- Finding departments with multiple employees.
- Displaying employees with their department and salary details.
- Finding employees who are not assigned to any project.
- Ranking employees based on salary.
- Calculating total payroll cost.
- Generating monthly attendance summaries.
- Finding the employee working on the maximum number of projects.
- Finding the department with the highest employee count.
- Finding the least busy project.
- Identifying employees with 100% attendance.

## Database Views

The project includes reusable SQL views such as:

- `high_earners`
- `dept_salary_summary`
- `employee_project_view`
- `employee_full_profile`
- `employees_without_projects`
- `monthly_attendance_summary`

These views simplify complex queries and provide reusable representations of frequently required information.

## Repository Structure

```text
HR_PAYROLL_MANAGEMENT_SYSTEM/
│
├── hr_payroll.sql
├── Project_Docs.pdf
└── README.md
```

## Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational database schemas.
- Creating relationships using primary and foreign keys.
- Writing SQL queries from basic to advanced levels.
- Using aggregate functions for data analysis.
- Applying GROUP BY and HAVING clauses.
- Working with different types of joins.
- Writing subqueries and nested subqueries.
- Creating reusable SQL views.
- Performing INSERT, UPDATE, and DELETE operations.
- Applying constraints to maintain data integrity.
- Creating indexes for database optimization.
- Using window functions for employee ranking.
- Performing payroll and attendance analysis.


