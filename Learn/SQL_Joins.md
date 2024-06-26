# SQL JOINS  
Joins are used to fetch data from multiple tables in a single query.  
Suppose, requirement is to display employee id, employee name along with computer id, model of the computer allocated to the employee in a single tabular format. These type requirements can be met using JOINS which can combine data from multiple tables.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/d5471ab4-26f2-4b97-8027-5d0a6e83533e)

JOINs are of multiple types:  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/10b38046-0fd1-4388-a6de-ce51d490fa5f)  
In addition, there's a Cross Join (Cartesian product) which is of academic interest only and is rarely used.  

### DATA TABLES  
We're going to use below 2 tables for learning joins.  
Employee Table             |  Computer Table
:-------------------------:|:-------------------------:
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/ad07be9c-a501-477d-a42d-38b3ae9b8750) | ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/61bcf294-9187-4481-b9ca-ded97aa01134)
  
## CROSS JOIN  
CROSS Join is also referred to as Cartesian Product. A CROSS join with m rows in table A and n rows in table B will always produce m * n rows. Essentially it combines each row from the first table with each row of the second table. A cross join is rarely used as it mostly produces lot of meaningless data.  
```
SELECT E.ID, E.ENAME, E.COMPID AS E_COMPID, C.COMPID, C.Model
FROM Employee E CROSS JOIN Computer C
```

## INNER JOIN  
INNER Join is the most frequently used JOIN. It matches the records from both tables based on the join predicate and returns only the matched rows. For ease of understanding one can think that first a Cartesian Product is created and then all the rows that do not meet the join condition are dropped from the result.  
```
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E INNER JOIN Computer C ON E.COMPID = C.COMPID
```  
```
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E INNER JOIN Computer C USING (COMPID)
```  
**Output:**  
| ID | ENAME          | E_COMPID | C_COMPID | MODEL     |
|----|----------------|----------|----------|-----------|
| 1  | James Potter   | 1001     | 1001     | Vostro    |
| 3  | Emily Rayner   | 1002     | 1002     | Precision |
| 5  | Ayaz Mohammad  | 1003     | 1003     | Edge      |

## LEFT OUTER JOIN  
LEFT OUTER Join for tables A and B will always return all records from table A even if matching record is not found in table B as per the join condition. For records where match is found the result set is exactly same as the inner join result. However for non matching records all columns from table B appear as NULL in the result.  
```
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL
FROM Employee E LEFT OUTER JOIN Computer C ON E.COMPID = C.COMPID
```  
**Output:**  
| ID | ENAME          | E_COMPID | C_COMPID | MODEL     |
|----|----------------|----------|----------|-----------|
| 1  | James Potter   | 1001     | 1001     | Vostro    |
| 2  | Ethan McCarty  | NULL     | NULL     | NULL      |
| 3  | Emily Rayner   | 1002     | 1002     | Precision |
| 4  | Jack Abraham   | NULL     | NULL     | NULL      |
| 5  | Ayaz Mohammad  | 1003     | 1003     | Edge      |

Left Outer Join is used to fetch all rows from a main table and some additional information from a lookup table using join condition. Unlike INNER JOINs additional conditions have to be supplied carefully depending upon the business requirement.  
```
SELECT Id, EName, Dept, E.CompId AS E_CompId, C.CompId AS C_CompId, Model
FROM Employee E LEFT OUTER JOIN Computer C
ON E.CompId = C.CompId
WHERE Dept = 'ETA'
```  
If we want to conditionally fetch values from the lookup table then the additional criteria must be combined with the join condition using AND operator.  
```
SELECT Id, EName, E.CompId AS E_CompId, C.CompId AS C_CompId, Model, MYear
FROM Employee E LEFT OUTER JOIN Computer C
ON E.CompId = C.CompId
AND MYear = '2014'
```  

## RIGHT OUTER JOIN  
RIGHT OUTER Join for tables A and B will always return all records from table B even if matching record is not found in table A as per the join condition. Right outer join is the mirror image of left join. In fact it is rarely used because the same resultset can be obtained by using a left join and reversing the order of the tables in the query.  
```
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E RIGHT OUTER JOIN Computer C ON E.COMPID = C.COMPID
```  
**Output:**  
| ID | ENAME          | E_COMPID | C_COMPID | MODEL     |
|----|----------------|----------|----------|-----------|
| 1  | James Potter   | 1001     | 1001     | Vostro    |
| 3  | Emily Rayner   | 1002     | 1002     | Precision |
| 5  | Ayaz Mohammad  | 1003     | 1003     | Edge      |
| NULL |     NULL     |   NULL   | 1004     | Horizon   |

## FULL OUTER JOIN
FULL OUTER Join combines the effect of both LEFT OUTER JOIN and the RIGHT OUTER JOIN. Full Outer Join between table A and table B returns matched as well as unmatched rows from both tables. For two tables with p and q rows, a 1:1 relationship and m matched rows the total number of rows in the resultset is m + (p - m) + (q - m) = p + q - m.  
```
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL
FROM Employee E FULL OUTER JOIN Computer C ON E.COMPID = C.COMPID
```  
**Output:**  
| ID | ENAME          | E_COMPID | C_COMPID | MODEL     |
|----|----------------|----------|----------|-----------|
| 1  | James Potter   | 1001     | 1001     | Vostro    |
| 2  | Ethan McCarty  | NULL     | NULL     | NULL      |
| 3  | Emily Rayner   | 1002     | 1002     | Precision |
| 4  | Jack Abraham   | NULL     | NULL     | NULL      |
| 5  | Ayaz Mohammad  | 1003     | 1003     | Edge      |
| NULL |     NULL     | NULL     | 1004     | Horizon   |

## SELF JOIN  
A self join is a regular join, but the table is joined with itself.  
### DATA TABLE  
We're going to use below table for learning self join.  
Employee Table             
:-------------------------:
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/8908eaaa-3ffe-4dd5-8711-322b408c8091)  
```
SELECT EMP.ID EMPID, EMP.ENAME EMPNAME, MGR.ID MGRID, MGR.ENAME MGRNAME 
FROM Employee EMP INNER JOIN Employee MGR ON EMP.MANAGER = MGR.ID
```  
**Output:**  
| EMPID | EMPNAME        | MGRID | MGRNAME       |
|-------|----------------|-------|---------------|
| 5     | Ayaz Mohammad  | 1     | James Potter  |
| 3     | Emily Rayner   | 2     | Ethan McCarty |
| 4     | Jack Abraham   | 2     | Ethan McCarty |

## SEMI JOIN  
Semi-join returns rows from the left table for which there are corresponding matching rows in the right table. Unlike regular joins which include the matching rows from both tables, a semi-join only includes columns from the left table in the result.  
**There are two main ways to perform a semi-join.**  
using EXISTS:  
```
SELECT column1, column2 FROM table1
WHERE EXISTS (SELECT 1 FROM table2 WHERE table1.column = table2.column);
```  
using IN:  
```
SELECT column1, column2 FROM table1
WHERE column IN (SELECT column FROM table2);
```

## ANTI JOIN
Anti-join is a type of join that returns only the rows from one table that do not have any matching rows in the other table. This is useful for identifying rows that are present in one table but not in the other.  
**There are two main ways to perform an anti-join.**  
Using LEFT JOIN and IS NULL operator:  
```
SELECT u.id
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id
WHERE o.user_id IS NULL;
```  
Using NOT IN operator:
```
SELECT id
FROM users
WHERE id NOT IN (SELECT user_id FROM orders);
```

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/26b69051-425f-406f-9db8-a1472040f401)

## SUMMARY  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/f61f7dc2-203c-42b0-8abf-e19a92e55759)  





