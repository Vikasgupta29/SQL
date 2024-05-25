# INTRODUCTION TO SQL  
**Structured Query Language** (SQL) is used to manage data in all relational databases like DB2, Oracle, SQL Server etc. SQL standards are maintained by ISO. While most database products comply with the ISO standard, they also offer additional proprietary features. In this course we will restrict ourselves to feature set offered by Oracle database.

## COMMANDS  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/673982ce-ba23-4138-b23c-566ddaee5615)

## DATA TYPES  
- Character data types
- Integral data types
- Non-Integral data types
- Miscellaneous data types  

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
**DROP TABLE <Table name> CASCADE CONSTRAINTS;**  
**CASCADE CONSTRAINTS** clause should be added to the DROP statement to drop all the referential integrity constraints that refer to primary and unique keys in the table.

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







  


