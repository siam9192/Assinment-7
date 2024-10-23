1.What is PostgreSQL?
Ans : PostgreSQL is a powerful, open-source, object-relational database management system (ORDBMS).

2.What is the purpose of a database schema in PostgreSQL?

3.Explain the primary key and foreign key concepts in PostgreSQL?
Ans :
Primary Key : A primary key is a column (or a set of columns) in a table that uniquely identifies each row in that table.Every table can have at most one primary key.The primary key ensures that no two rows have the same value for that key, and the value cannot be NULL.

ForeignKey:A foreign key is a column (or set of columns) in one table that refers to the primary key of another table.The foreign key establishes a relationship between two tables, ensuring that the value in the foreign key column matches an existing value in the referenced table’s primary key.

4.What is the difference between the VARCHAR and CHAR data types?
Ans: CHAR for fixed-length data, and VARCHAR for variable-length data.

5.Explain the purpose of the WHERE clause in a SELECT statement?
Ans:The WHERE clause in a SELECT statement is used to filter records from a table, returning only the rows that meet specific conditions. It allow limit the data retrieved based on defined criteria.

6.What are the LIMIT and OFFSET clauses used for?
Ans:The LIMIT clause restricts the number of rows returned in a query, while the OFFSET clause skips a specified number of rows before starting to return the results. Together, they are often used for pagination.

7.How can you perform data modification using UPDATE statements?
Ans:Specify the table Identify the table containing the data i want to modify.Set new values: Use the SET clause to assign new values to the columns.Filter rows (optional): Use the WHERE clause to specify which rows to update. Without it, all rows will be updated.

8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
Ans:The JOIN operation in PostgreSQL combines rows from two or more tables based on related columns, allowing retrieval of related data. The most common types are INNER JOIN, which returns only matching rows; LEFT JOIN, which returns all rows from the left table and matched rows from the right; and RIGHT JOIN, which does the opposite. Joins help maintain data normalization and enable complex queries across multiple tables.

9.Explain the GROUP BY clause and its role in aggregation operations.
Ans: The GROUP BY clause in SQL organizes rows with the same values in specified columns into groups, allowing for aggregation operations like SUM(), COUNT(), etc. It enables calculations on each group, such as total sales per region

10.How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
Ans:
* COUNT

SELECT COUNT(*) AS TotalRows
FROM table_name;  

SELECT COUNT(column_name) AS NonNullCount
FROM table_name
WHERE condition;  -- Counts non-null values in a specific column based on a condition
* SUM

SELECT SUM(column_name) AS TotalAmount
FROM table_name
WHERE condition; 

* AVG

SELECT AVG(column_name) AS AverageValue
FROM table_name
WHERE condition;  

11.what is the purpose of an index in PostgreSQL, and how does it optimize query performance?
Ans:Indexes in PostgreSQL enhance query performance by speeding up data retrieval and reducing I/O operations. They improve filtering, sorting, and joins but can slow down write operations and consume extra  space.

12.Explain the concept of a PostgreSQL view and how it differs from a table ?
Ans:A PostgreSQL view is like a virtual table that shows data from one or more real tables without storing it. It helps simplify complex queries and can restrict access to certain data, but it can be slower to use since it generates results on the fly.

