# Student Tracker Database Project

## Overview

This project defines a complete **Student Tracking System** using
MySQL.\
It includes tables for students, faculty, departments, courses,
enrollments, attendance, and grades.\
Additionally, various SQL queries demonstrate CRUD operations, joins,
subqueries, aggregations, window functions, and conditional statements.

------------------------------------------------------------------------

## Database Schema

### **1. Students Table**

Stores student personal and academic details.

### **2. Faculty Table**

Stores faculty information including experience and department.

### **3. Departments Table**

Contains department names.

### **4. Courses Table**

Stores course details and assigned faculty.

### **5. Enrollments Table**

Tracks which student enrolled in which course.

### **6. Attendance Table**

Tracks student attendance per course per date.

### **7. Grades Table**

Stores marks obtained by students in each course.

------------------------------------------------------------------------

## Sample Data Inserted

The SQL script inserts: - Departments (3 records) - Students (2 main + 1
later inserted and deleted) - Faculty members (2 records) - Courses (2
records) - Enrollments (2 records) - Attendance entries - Grades (2
records)

------------------------------------------------------------------------

## Key SQL Operations Demonstrated

### **CRUD Operations**

-   `INSERT` new records\
-   `UPDATE` student phone number\
-   `DELETE` a student\
-   `SELECT` queries for data viewing

### **Filtering & Sorting**

-   Students by department\
-   Top marks using `ORDER BY ... LIMIT`

### **Aggregations**

-   Attendance percentage using `COUNT()`\
-   Students with low attendance\
-   Students with low attendance and low marks

### **Subqueries**

-   Checking high-performing students\
-   Courses with experienced faculty

### **Joins**

-   Unassigned faculty\
-   Courses without faculty\
-   Students without grades

### **Window Functions**

-   Ranking students by marks\
-   Running totals of enrollment\
-   Total presents using `OVER (PARTITION BY ...)`

### **Case Expressions**

-   Performance categories\
-   Attendance categories

### **Date & String Functions**

-   `TIMESTAMPDIFF`, `DATE_FORMAT`, `UPPER`, `TRIM`

------------------------------------------------------------------------

## How to Use

1.  Run the SQL script in a MySQL environment (e.g., phpMyAdmin, MySQL
    Workbench).
2.  Ensure the database `student_tracker` is created.
3.  Execute the script step-by-step or all at once.
4.  Use the provided queries to analyze student performance, attendance,
    and faculty/course data.

------------------------------------------------------------------------

## Purpose

This database is ideal for: - University student tracking - Attendance
management - Academic performance monitoring - Faculty/course analysis

------------------------------------------------------------------------

## Author

**Student Tracker SQL Project**\
Automatically generated README file.
