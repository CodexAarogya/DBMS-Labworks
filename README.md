# DBMS Lab — Repository Documentation

## Overview
This repository contains SQL labs and a small DBMS project used for coursework and exercises. The following document inventories files and folders, summarizes their purpose, and provides a concise "About / Usage" section including the requested `use =d` operation explanation.

## Table of contents
- Files & folders
- Project / Outputs
- About / Usage (includes `use =d`)

## Files & folders

- `lab2-dbms.sql` — Project setup and schema definition. Creates the `LAB2` database and tables (`employee`, `booklist`, `bookID`, `issues`), includes constraints, default values, and sample `INSERT` statements. Contains tasks and example queries for selection and schema constraints.

- `LAB-4.sql` — Aggregation, sorting and subquery exercises. Begins with `USE LAB2;` and includes queries for sorting, TOP selection, aggregate functions (`SUM`, `MIN`, `AVG`), grouping, and correlated subqueries and joins.

- `Lab-5.sql` — Joins, views, and stored-procedure exercises. Begins with `USE lab2;` and demonstrates inner/left/right/full joins, view creation (`employee_view`), deletion from a view, and a `salary_increment` stored procedure.

- `lab4-test.sql` — DDL/DML practice and updates. Starts with `USE LAB2;` and covers `ALTER TABLE`, `UPDATE` (including `CASE`), `DELETE`, and subqueries; contains commented examples of inserts and other tests.

- `SQLQuery1.sql` — Miscellaneous query examples and aggregates. Starts with `USE lab2;` and contains `AVG`, `MAX`, `MIN`, `GROUP BY`/`HAVING`, and several `SELECT` examples used for practice and validation.

- `Supplementary_lab2.sql` — Additional exercises and stored procedures. Starts with `USE LAB2;` and provides more join examples, stored procedures (`display_book`, `add_book`, `count_book`, `list_issue_name`), and sample queries that expand on lab 2 topics.

- `Project/DBMS_Project.sql` — A standalone E-COMMERCE schema and dataset. Creates `ECOMMERCE` database, tables (`customers`, `products`, `orders`, `order_items`), inserts sample data, and contains multiple analytic query examples (orders per customer, product sales, revenue queries).

- `Project/Database-design-ecommerce.png` — Diagram image for the e-commerce database design (ER diagram / schema visualization).

- `Project/Outputs/` — Report files (`.rpt`) produced as lab outputs or query reports. Files include `Qn1.rpt`, `Qn2.rpt`, `Qn3.rpt`, `qn4.rpt` ... `qn14.rpt` and more. These are final report artifacts (read-only summaries), not SQL sources.


## Project / Outputs (short listing)

- `Project/DBMS_Project.sql` — E-commerce schema + sample data and example queries (see file for full SQL).
- `Project/Database-design-ecommerce.png` — Schema diagram.
- `Project/Outputs/` — Contains per-question `.rpt` files (Qn1.rpt, Qn2.rpt, Qn3.rpt, qn4.rpt, ..., qn14.rpt) representing report outputs.


## About / Usage

Purpose: This repository is for DBMS learning — schema creation, DDL/DML practice, joins, views, stored procedures, and reporting.

Operation: `use =d`
- Literal inclusion: `use =d` is placed here as requested.
- Likely interpretations and how to apply them:
  - SQL database selection: use `USE d;` to switch to database `d` (example: `USE LAB2;`).
  - If `=d` was intended as a CLI/flag shorthand, the common patterns are `--db=d` or `-d d` depending on the script (example: `myscript.exe --db=LAB2` or `myscript -d LAB2`).

Quick start
- To run lab SQL files against a local MS SQL / MySQL / MariaDB server, open your SQL client and execute the file contents in order prefixed with a database context. Typical first commands inside files use `USE LAB2;` or `CREATE DATABASE LAB2;` — run `lab2-dbms.sql` first to create the schema and seed data.

Notes & recommendations
- Review `lab2-dbms.sql` first to create the `LAB2` database and initial tables before running other lab scripts that assume that schema.
- `Project/DBMS_Project.sql` is self-contained for the `ECOMMERCE` database and can be executed independently.
- Report files in `Project/Outputs/` are artifacts — keep them for grading or reference; they need not be executed.


