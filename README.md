# Database Queries

A collection of database queries and practice work covering **SQL and NoSQL databases**.

This repository contains my practice with database concepts, query writing, schema design, constraints, relationships, and CRUD operations.

Currently, the repository contains **SQL queries written and tested using PostgreSQL**, with NoSQL queries to be added as the collection grows.

## 🛠️ Technologies

* MYSQL
* NoSQL *(to be added)*
* Git & GitHub

## 📁 Repository Structure

```text
databases/
├── postgresql/
│   └── queries.sql
└── README.md
```

The structure may expand as queries for other database systems are added.

## ⚙️ PostgreSQL Setup

### 1. Install PostgreSQL

Install **PostgreSQL** and a PostgreSQL client such as **pgAdmin 4**.

### 2. Start PostgreSQL Server

Make sure the PostgreSQL server is running before executing queries.

### 3. Connect to PostgreSQL

You can connect using **pgAdmin 4** or the PostgreSQL command line:

```bash
psql -U postgres
```

Enter your PostgreSQL password when prompted.

### 4. Create a Database

```sql
CREATE DATABASE practice;
```

Connect to the database and execute the queries from the repository.

### 5. Run the Queries

Open the SQL files from this repository in **pgAdmin Query Tool** or execute them using `psql`.

## 📚 Topics Covered

The queries in this repository cover concepts such as:

* Database and schema creation
* Table creation and modification
* `CREATE`, `ALTER`, `DROP`
* `INSERT`, `UPDATE`, `DELETE`
* `SELECT`
* `WHERE`
* `IN`
* `LIKE`
* `IS NULL` / `IS NOT NULL`
* Constraints
* Primary Keys
* Foreign Keys
* Joins
* Aggregate Functions
* `GROUP BY`
* `HAVING`
* Subqueries
* Schema Design

More topics will be added as I continue practicing.

## 🗄️ Databases

This repository is intended to contain queries and learning material for different database systems.

### SQL / Relational Databases

* PostgreSQL
* MySQL
* Other relational databases as added

### NoSQL Databases

* MongoDB
* Other NoSQL technologies as added

The repository will be expanded over time with queries and examples for different database systems.

## 🎯 Purpose

The purpose of this repository is to maintain my **database practice and query collection** in one place while building a stronger understanding of SQL, database design, relational concepts, and NoSQL databases.

---

**Learning by writing, testing, and breaking queries. 🚀**
