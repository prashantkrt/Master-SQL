-- The DROP command in SQL is used to remove an entire database, table, view, index, or other database objects from the database system.

-- To remove a table and all its data:
DROP TABLE table_name;

-- To remove a database and all its objects:
DROP DATABASE database_name;

-- Dropping a Foreign Key Constraint
-- To remove a foreign key constraint from a table:
ALTER TABLE table_name DROP FOREIGN KEY constraint_name;
ALTER TABLE Orders DROP FOREIGN KEY fk_customer_id;

