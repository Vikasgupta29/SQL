# Normalization
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

#### Functional Dependency
An anomaly is an unexpected side effect from trying to insert, update, or delete a row. Essentially more data must be provided to accomplish an operation than would be expected.
Consider the table retailoutletstock:
![image](https://github.com/Vikasgupta29/SQL/assets/92180754/0c60631a-9dd9-4436-a47f-57c5d53ef3b6)
What happens if we try to insert(add) the details of a new retail outlet that currently has no items in its stock?
- NULL values would be inserted into the itemdetails columns, which is not preferable.
What happens if we try to delete the item of an itemcode I1005?
- The details of the retail outlet R1003 will also be deleted from the database.
How many rows will be updated if the retail outlet location of R1002 is changed from Victoria Street to Saint John Street?
- 3 Rows will be updated
What are the details we need to insert when new items are supplied to a retail outlet?
- Apart from all necessary details, retailoutletlocation will also be inserted which is redundant
We have seen insert, delete, update anomalies, and data redundancy in the above given example. Functional dependencies may lead to anomalies. To minimize anomalies there is a need to refine functional dependencies using Normalization.







