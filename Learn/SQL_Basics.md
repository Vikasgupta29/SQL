# INTRODUCTION TO SQL  
**Structured Query Language** (SQL) is used to manage data in all relational databases like DB2, Oracle, SQL Server etc. SQL standards are maintained by ISO. While most database products comply with the ISO standard, they also offer additional proprietary features. In this course we will restrict ourselves to feature set offered by Oracle database.

## COMMANDS  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/673982ce-ba23-4138-b23c-566ddaee5615)

## DATA TYPES  
- Character data types
- Integral data types
- Non-Integral data types
- Miscellaneous data types
</br>
1. SQL supports two character data types for storing printable and displayable characters.  
   ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/7e8be429-4beb-4a18-a58f-137680d73880)  
3. SQL supports SMALLINT, INTEGER and INT data types that are used for storing whole numbers.  
4. Nonintegral data types have an integer part and a fractional part. Either NUMERIC, FLOAT, DECIMAL or NUMBER data types can be used to store nonintegral numbers.  
   ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/e8e4a2a5-d11f-4ed3-861c-eaec60d5a5c0)  
5. For storing date/time SQL supports DATE, TIME and DATETIME.  

## OPERATORS  
- Arithmetic operators  
  ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/35deff5a-437c-4ad6-856c-6f07cdd4d053)  
- Comparison operators  
  ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/fd55da3b-0d8b-4709-a1b7-d7beb0f62d21)
  ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/90634c59-d104-490c-b201-0621534cce18)  
- Logical operators  
  ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/1864a7ae-9f94-47e5-92c6-39d3520cf825)  

## CREATE AND DROP TABLE  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/42f7a0d1-add9-4fb1-8aca-60286578f501)

An alternate method to drop table is given below:  
**DROP TABLE table_name CASCADE CONSTRAINTS;**  
CASCADE CONSTRAINTS clause should be added to the DROP statement to drop all the referential integrity constraints that refer to primary and unique keys in the table.

## CONSTRAINTS  
constraints are typically specified along with the CREATE TABLE statement. Constraints are classified into different types based on the number of columns they act upon as well as on the way they are specified.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/47f0a58f-c80f-4ca2-88e6-9fbdf240431d)
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/92046343-2015-422a-9b58-14ec471d5004)  

Table level constraint can be specified after all columns used in the constraint have been defined. It is not necessary to specify them after all columns in the table are defined. Composite constraints can only be specified as table level constraints.  
Various constraints that can be created on database tables are:  
- NOT NULL  
- PRIMARY KEY
- CHECK
- UNIQUE
- FOREIGN KEY
- We can also specify DEFAULT value for a column.  

### NOT NULL  
NOT NULL Constraint prevents a column from accepting NULL values. NOT NULL can only be applied as a column level constraint.  
CREATE TABLE Student (  
    StudentId INTEGER CONSTRAINT Stud_SId_nn NOT NULL,  
    FName VARCHAR2(10) NOT NULL,  
    LName VARCHAR2(10));  

### DEFAULT
A column can be given the default value by using DEFAULT option. The data type of column and default expression must be the same.  
CREATE TABLE Student (  
    StudentId INTEGER,  
    FName VARCHAR2(10),  
    DOJ DATE DEFAULT SYSDATE);  

### PRIMARY KEY  
PRIMARY KEY constraint on a column ensures that the column cannot contain NULL and duplicate values. We can have only one PRIMARY KEY in a table.  
CREATE TABLE Student (  
    StudentId INTEGER CONSTRAINT stud_sid_pk PRIMARY KEY,  
    FName VARCHAR2(10),  
    ContactNo NUMBER(10));  

### CHECK  
CHECK constraint is used to limit the values that can be specified for a column.  
CREATE TABLE Student (  
    StudentId INTEGER,  
    FName VARCHAR2(10),  
    Gender CHAR(1) CONSTRAINT Stud_gender_ck1 CHECK(Gender IN('M', 'F')));  

### UNIQUE  
UNIQUE constraint on a column ensures that two rows in a table cannnot have same value in that column. Unlike Primary Key, UNIQUE constraint allows NULL values. A table can have many UNIQUE constraints.  
CREATE TABLE Student (  
    StudentId INTEGER,  
    FName VARCHAR2(10),  
    ContactNo NUMBER(10) CONSTRAINT Stud_cno_uk UNIQUE);  

### FOREIGN KEY  
CREATE TABLE Marks(  
    CourseId INTEGER,   
    StudentId INTEGER CONSTRAINT marks_sid_fk REFERENCES Student(StudentId),  
    MarksScored DECIMAL(5,2));  
*Student Table has already been created and inserted with few records in the database.  

### CONSTRAINT SUMMARY  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/e913ad62-a88e-46ae-8b54-0d5673e44dec)

## ALTER TABLE
ALTER TABLE command are used to change the structure of the existing table without any loss of data. It can also be used to rename a column, change the data type of a column and to add or remove constraints.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/4c380e9d-bda8-4e32-930a-d6bc4e3dcced)

## INSERT STATEMENT  
Insert statement is used to add tuples (records) to the table.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/c19b23d5-84d2-4df5-a443-5df3a5ae24a5)

## SELECT STATEMENT  
SELECT Statement in SQL is used to retrieve or fetch data from a database. We can fetch either the entire table or according to some specified rules.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/e771859c-9d72-4f13-8480-d4cb84272111)

SELECT statement can have many clauses so it is important to understand the order in which these are executed to provide the result. A quick way to remember this is to use the mnemonic "Frank John's Wicked Grave Haunts Several Dull Owls".  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/fac11b2e-5e05-4ea5-8e5c-f39ba791655d)

## UPDATE STATEMENT  
Update statement is used to modify existing rows in a single table in a relational database. The database system ensures that no constraints are violated during execution of an update statement. Any violation of constraints results in failure of the statement.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/f51d917c-60dc-4502-bfc3-2719996190a2)

## DELETE STATEMENT  
DELETE statement is used to delete records from a single table in a relational database. The database system ensures that no constraints are violated during the execution of a delete statement. Any violation of constraints results in failure of the statement.  
TRUNCATE statement can also be used to delete data from tables. TRUNCATE statement deletes all records from the table as it does not support WHERE clause. TRUNCATE statement is a faster option compared to DELETE when you have to delete all records from the table.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/5a9a822d-3ba9-41c5-a9de-efd7778f82d0)

## SQL FUNCTIONS  
SQL provides many built-in functions in order to accomplish many tasks. Some of the commonly used built-in functions are:
- Numeric functions 
- Character functions
- Conversion functions 
- Date functions 
- Aggregate functions    
SQL functions are built in modules provided by a database. You can use them in data manipulation statements to perform calculations on data.  
All functions return a single value. They are categorized into two types based on number of rows they operate upon.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/f71f4498-815b-42f9-80db-d80f26ac5849)  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/78f1a538-db31-4a27-8705-73f764852711)  
Aggregate functions operate on multiple rows to return a single row. All aggregate functions ignore NULL values except COUNT(*).  










  



