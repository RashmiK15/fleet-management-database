# Fleet Management Database

A relational database project developed as part of a Database Management Systems (DBMS) course.

The project models a fleet management system for managing branches, employees, warehouses, vehicles, clients, consignments, transportation details, and locations. It demonstrates relational database design, SQL querying, and PL/SQL programming using Oracle SQL.

## Database Design

The database consists of eight main relations:

- **Locations** – stores location information such as area, city, state, and PIN code.
- **Branch** – stores fleet management branch information and associated locations.
- **Employee** – stores employee details, branch assignments, and addresses.
- **Warehouse** – stores warehouse information and its associated branch and location.
- **Consignment** – stores information about transported materials, delivery dates, payments, weight, and flammability.
- **Client** – stores client details and associated consignments.
- **Vehicle** – stores vehicle registration, insurance, type, status, capacity, permit, consignment, and branch information.
- **Conveyance** – stores transportation information including source, destination, distance, employee, and vehicle.

The relational schema was designed using an Entity-Relationship model and normalized through Third Normal Form (3NF).

## ER Diagram

![Fleet Management ER Diagram](diagrams/er-diagram.png)

## Technologies

- Oracle SQL
- PL/SQL
- Oracle SQL Developer
- Relational Database Management Systems (RDBMS)

## SQL Implementation

The SQL portion of the project includes:

- Database schema creation
- Primary and foreign key relationships
- Sample data insertion
- Multi-table joins
- Arithmetic and logical operations
- Aggregate functions
- `GROUP BY` and `HAVING`
- Nested queries and subqueries
- Set operations
- Views
- Data update operations

## PL/SQL Implementation

The PL/SQL portion demonstrates:

- Records
- `%ROWTYPE` and `%TYPE`
- Explicit cursors
- Exception handling
- Stored procedures
- Functions
- Triggers
- `DBMS_OUTPUT`

## Repository Structure

```text
fleet-management-database/
├── README.md
├── sql/
│   ├── schema.sql
│   ├── sample_data.sql
│   └── queries.sql
├── plsql/
│   └── plsql_queries.sql
└── diagrams/
    └── er-diagram.png
```

## Files

### `sql/schema.sql`

Contains the relational database schema and table definitions.

### `sql/sample_data.sql`

Contains sample records used to populate the database.

### `sql/queries.sql`

Contains SQL queries demonstrating joins, operators, aggregate functions, subqueries, set operations, views, and other database operations.

### `plsql/plsql_queries.sql`

Contains PL/SQL exercises using records, cursors, procedures, functions, triggers, and exception handling.

### `diagrams/er-diagram.png`

Contains the Entity-Relationship diagram used for the database design.

## Academic Project

Originally developed as part of an academic project with my teammates at KLE Technological University.
