# SQL JOINS  
Joins are used to fetch data from multiple tables in a single query.  
Suppose, requirement is to display employee id, employee name along with computer id, model of the computer allocated to the employee in a single tabular format. These type requirements can be met using JOINS which can combine data from multiple tables.  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/d5471ab4-26f2-4b97-8027-5d0a6e83533e)

 JOINs are of multiple types:
 ![image](https://github.com/Vikasgupta29/SQL/assets/92180754/10b38046-0fd1-4388-a6de-ce51d490fa5f)  
In addition, there's a Cross Join (Cartesian product) which is of academic interest only and is rarely used.  

## CROSS JOIN  
CROSS Join is also referred to as Cartesian Product. A CROSS join with m rows in table A and n rows in table B will always produce m * n rows. Essentially it combines each row from the first table with each row of the second table. A cross join is rarely used as it mostly produces lot of meaningless data.  
```
SELECT E.ID, E.ENAME, E.COMPID AS E_COMPID, C.COMPID, C.Model
FROM Employee E CROSS JOIN Computer C
```
