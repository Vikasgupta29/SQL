# SQL CLAUSES  
SQL clause helps us to retrieve a set or bundles of records from the table. They're also used to specify a condition on the columns or the records of a table. With the help of clauses, we can deal with data easily stored in the table. Clauses help us filter and analyze data quickly. When we have large amounts of data stored in the database, we use Clauses to query and get data required.  

## DISTINCT  
The distinct keyword is used in conjunction with the select keyword. It is helpful when there is a need to remove duplicate values present in any specific columns/table. When we use distinct keywords only the unique values are fetched.  
**SELECT DISTINCT Dept FROM Employee**  
- Usage of DISTINCT should be avoided as far as possible as it can lead to performance issues.  
- If DISTINCT is used with multiple columns then two rows are considered equal only if all their columns match.  
- DISTINCT must be used immediately after SELECT. Any attempt to use it between columns will result in error.  
- Distinct can also be used with NULL columns to remove duplicate NULL values.  

## WHERE  
WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.  
- Use comparison operators to restrict rows. The filter criteria can be on attributes that are not on the select clause.  
- **BETWEEN** operator is used to check for values within a range. The result includes both the boundary values.  
- **IN** is used to specify multiple possible values for a column. If IN clause contains duplicate values then the database server will remove duplicates before executing the query.  
- **NOT** operator is used to negate the condition.  
- **IS NULL** operator is used to check NULL values in columns.  
- **LIKE** operator is used to match a character pattern. It allows us to use wild cards. SQL supports two wild cards: '%' which matches with any number of characters and '_' which matches with exactly one character.  

## CASE  
CASE statement can be used in SELECT to conditionally assign values to a computed attribute. It can also be used with WHERE, GROUP BY etc.  
CASE statement has two different syntax styles:  
Simple CASE expression  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/064cc179-1a24-4908-92f1-56d7cd51e9b3)

Searched CASE expression  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/72165df2-92d5-45da-ac17-75606a27e79f)

The CASE statement goes through conditions and returns a value when the first condition is met. So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.  
NOTE: ELSE is optional. If ELSE is omitted and no condition is true, then NULL is returned by CASE.  

## ORDER BY  
ORDER BY must be used to specify the columns on which data has to be sorted and the sort order i.e. ascending or descending. Rows are sorted in ascending order if sort order is not specified. DESC should be used to sort the rows in descending order. ORDER BY clause must be the last clause in SELECT statement.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/c685a3b1-460c-4618-9d27-db67a03daa57)

An important point to note is that sorting of rows in the result is guaranteed only on columns specified in the ORDER BY clause. If multiple rows have same value for columns in ORDER BY clause then they can appear in any order.  

## GROUP BY  
GROUP BY groups the data from the table into different groups based on the criteria provided and calculates the aggregate function for each group. Thus the result has 1 row for each group.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/b6fb5fa1-5ed7-4fb3-860a-f510c8fadb70)

- Without Group By Aggregate function produces 1 row for all the rows selected by a query.  
- **HAVING** clause allows aggregate functions to be used as filter criteria which cannot be done using WHERE clause.  
  SELECT DEPT, SUM(Salary) FROM Employee GROUP BY DEPT HAVING SUM(Salary) > 90000;  
- Aggregate functions cannot be used in WHERE clause even if GROUP BY is used.  
- Nested aggregate function cannot be used in SELECT clause without GROUP BY clause.  
- Order By cannot be used on columns on which Grouping is not being done.  

Do’s for Group by and Having clauses:  
1. GROUP BY clause should contain all non-aggregate columns that are present in SELECT clause
2. GROUP BY clause should be mandatory when there is a list of aggregate and non-aggregate columns in SELECT statement
3. Whenever nested aggregate columns appear in the SELECT clause, GROUP BY clause should be mandatorily used
4. HAVING cannot be written without the GROUP BY clause in the query
5. Aggregate column condition(s) should always be written along with the HAVING clause and not with the WHERE clause  

Don’ts for Group by and Having clauses:
1. Columns from the list of the SELECT clause should not be skipped in the GROUP BY clause. However, you can add an extra non-aggregate column which is not present in the SELECT to the GROUP BY clause
2. GROUP BY clause should not contain any aggregate columns
3. Aliased name given for the column should not be used in GROUP BY clause
4. HAVING clause should not contain non-aggregate columns which are not present in the GROUP BY clause  

















