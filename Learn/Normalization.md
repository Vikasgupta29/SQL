# NORMALIZATION
When databases are designed and used, they need to be checked for the possibility of several issues such as inconsistency, redundancy and uncertainty. Let us understand the inconsistency and redundancy of data with examples.  

retailoutletstock is identified as a relation with the following attributes:  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/e582d228-0ef0-4f21-b9c3-4c69c50edb5d)

This is represented in a relational notation as follows:  
retailoutletstock (retailoutletid, itemcode, description, retailoutletlocation (street, city, zipcode), qtyavailable, retailunitprice, itemclass)  

**Data redundancy** occurs when the same data is multiplied across the database and can be found repeated in an unnecessary form. Consider the data stored for a retailoutletstock as per the relation given earlier.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/de1b10a2-367e-4c0b-bab5-f4c79fb0649f)

You can notice in the data stored that the retailoutletid and retailoutletlocation are repeating for every item available in the retail outlet store. This is an example of redundant information. Redundant information will lead to more disk space to store the data than actually required.  

**Data inconsistency** results from anything that affects data integrity. This can cause the data to be correct in one place and wrong elsewhere it is stored. This can lead to unreliable and meaningless information.  

Consider the following relations for the case study:  
**retailoutletstock** (retailoutletid, itemcode, description, retailoutletlocation (street, city, zipcode), qtyavailable, retailunitprice, itemclass)  
**itemavailability** (itemcode, description, retailoutletid, retailoutletaddress (street, city, zipcode), qtyavailable)  
The retailoutletlocation in the _retailoutletstock_ table and _retailoutletaddress_ in itemavailability relations refer to the address of a retail outlet but present in different forms. This may lead to an inconsistent address stored for a retail outlet .To retrieve the correct address or update it , both these relations need to be considered.  
The issues mentioned arise due to poorly designed/structured databases or when they are expanded without much planning to include newer elements over a period. These issues can cause huge business failures and hence must be addressed.  
Data redundancies can be avoided by using normalization during design of databases, inconsistency can be avoided using database constraints. As a beginner to learning databases, you will understand the importance of designing good databases and identifying databases that suffer from redundancy and inconsistency.  

## FUNCTIONAL DEPENDENCY
Normalization is the process of reorganizing data in a database to ensure that there is no redundancy of data and data dependencies are logical (all related data items are stored together).  
The different stages of normalization are known as “normal forms”. To accomplish normalization, we need to understand the concept of Functional Dependencies.  
Functional Dependencies in DBMS is a relation between two or more attributes. It can be categorized as -  
- Fully Functional Dependency
- Partial Dependency
- Transitive Dependency  

If functional dependencies are not properly defined, the databases may suffer from the following anomalies.
- Update/Modification anomalies – if data is inconsistently stored, it can lead to update anomalies
- Deletion anomalies – when a row is deleted that may contain attributes that shouldn't be deleted
- Insert anomalies – when a data is inserted that does not exist at all  

Normalization is a method to remove all these anomalies and bring the database to a consistent state.  
Let us see these anomalies in detail with an example.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/b5cb085f-8fea-42c2-a1a1-6b03b91f73a9)

An anomaly is an unexpected side effect from trying to insert, update, or delete a row. Essentially more data must be provided to accomplish an operation than would be expected.  

Consider the table retailoutletstock:  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/0c60631a-9dd9-4436-a47f-57c5d53ef3b6)

1. What happens if we try to insert(add) the details of a new retail outlet that currently has no items in its stock?  
   NULL values would be inserted into the itemdetails columns, which is not preferable.  
2. What happens if we try to delete the item of an itemcode I1005?  
   The details of the retail outlet R1003 will also be deleted from the database.  
3. How many rows will be updated if the retail outlet location of R1002 is changed from Victoria Street to Saint John Street?  
   3 Rows will be updated.  
4. What are the details we need to insert when new items are supplied to a retail outlet?  
   Apart from all necessary details, retailoutletlocation will also be inserted which is redundant.  

Functional dependencies may lead to anomalies. To minimize anomalies there is a need to refine functional dependencies using Normalization.  

## NORMAL FORMS
Database normalization is the process of structuring a relational database in accordance with a series of so-called normal forms in order to reduce data redundancy and improve data integrity.  
Normal Forms (NF) are the different stages of normalization,  
1 NF (First Normal Form)  
2 NF (Second Normal Form)  
3 NF (Third Normal Form)  
BCNF (Boyce -Codd Normal Form)  
4 NF (Fourth Normal Form)  
5 NF (Fifth Normal Form)  
6 NF (Sixth Normal Form)  

*4NF, 6NF & 6NF is applicable to multivalued dependencies and complex table scenarios.   

### 1 NF
A relation R is said to be in 1 NF (First Normal) if and only if:  
- All the attributes of R are atomic in nature  
- There should not be any multi-valued attribute  

To achieve 1 NF, we will split the non-atomic attribute, **retailoutletlocation** into three different attributes- **street**, **city** and **zipcode** all of them being atomic, the resulting relation will be in First Normal Form.  

The resulting retailoutletstock table in First Normal Form(1 NF) is:  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/65f0fe8e-89b2-4f86-925d-d722165282e7)

Note:- A multi-valued attribute is an attribute which can have more than one value at a time which is not the case in the above relation.   

**Advantage:**  
1 NF allows users to use the database queries effectively as it removes ambiguity by removing the non-atomic and multi-valued attributes which creates the major issues in the future while updating and extracting the data from the database.  
**Limitation:**  
As we can see in the retailoutletstock relation above, the attribute description is dependent only on itemcode (I1001->Britannia Marie Gold Cookies). Hence, we have the redundant data in the table which can be eliminated by having a separate table for item details which leads us to the next normal form.  

### 2NF  
A relation R is said to be in 2 NF (Second Normal) form if and only if:  
- R is already in 1 NF  
- There is no partial dependency in R which exists between non-key attributes and key attributes  

To make a table 2 NF compliant, remove all such partial dependencies and decompose the relation.  

The retailoutletstock is already in 1 NF, but we have the following partial dependencies which must be removed in order to make the relation in 2 NF.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/70de2e40-6b1e-4166-85ce-f17c9a016f65)

After removing the partial dependencies, we have three tables item, retailoutlet and retailstockdetails, each of them in 2 NF.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/f5ea98a7-9b50-4fa6-8fdc-04a6f2505271)
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/a77eb3b8-beed-4dc9-b4e4-b0bae92b253f)

**Advantage:**  
2 NF attempts to reduce the amount of redundant data in a table by extracting it, placing it in a new table(s) and creating relationships between those tables.  

**Limitation:**  
Still, in the case study, we can see that itemclass attribute is completely dependent on retailunitprice and it is repeated whenever two items have the same retailunitprice. So, we still have data redundancy.  
If the itemclass is changed for a range of retailunitprice, we will have to update all the records in the retailstockdetails. Which leads us to the third normal form.  

### 3NF  
A relation R is said to be in 3 NF (Third Normal Form) if and only if:  
- R is already in 2 NF
- There is no transitive dependency which exists between key attributes and non-key attributes through other non-key attributes  
A transitive dependency in a database is an indirect relationship between attributes in the same table that causes a functional dependency.  
X -> Z is a transitive dependency if the following three functional dependencies hold true:  
X->Y  
Y does not ->X  
Y->Z  

To make retailstockdetails 3 NF compliant, we must remove all such transitive dependencies by decomposing the relation.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/3f64a2f3-edaa-404b-9afa-b07bf70346a7)

Note:- The item and retailoulet tables are not having any transitive dependency.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/968a9b43-24e3-41ff-a2e9-1faeaa7ceb31)

After removing the transitive dependency from retailstockdetails, it will result in the following tables.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/75c90910-81fa-47f3-8e87-99dc9f23b5a2)

Even after converting to 3 NF, we can see that storing itemclass for every retailunitprice is not an efficient way. So, it is more appropriate to store it in the following way:  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/2859242b-3549-4e1b-a77f-ec5b7d989c50)

**Advantage:**  
3 NF ensures data integrity. It also reduces the amount of data duplication.  

### SUMMARY  
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/6c26e89e-3a2f-49c0-b844-e635c2cc7ec0)

**Using normalization:**  
- Depending on the business requirements, the tables should be normalized  to 2NF or 3NF.  
- Tables in 3 NF are preferred in applications with extensive data modifications.  
- Tables in 2 NF are preferred in applications with extensive data retrieval because retrieving data from multiple tables is a costly operation.  

![image](https://github.com/Vikasgupta29/SQL/assets/92180754/a753d9ff-7d57-49f6-838d-4efa352ace4d)

