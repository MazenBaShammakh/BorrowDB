# BorrowDB

This is a dummy database for a mobile platform that allows neighboors to borrow and lend each others belongings as an alternative to purchasing them. For instance, it will help them save the money used to purchase infrequently used items, which are items that's not used in the daily basis and might sometimes be expensive. 

## SQL Tables
The SQL tables used in borrowingItems_tables.sql are:
* Peer: includes general info about users, whether they are lenders or borrowers 
* Lender: includes info specific to lenders
* Borrower: includes info specific to borrowers
* Item: include item details
* Borrowing: includes info about a borrowing transaction
* Rating: include info about a rating posted by a user

**Note:** the data is being populated in borrowingItems_data.sql.

## SQL Statements
The SQL statements used in borrowingItems_sql.sql are:
* Number of users in each state/city
* Category of the frequently borrowed items
* Display all comments addressed to Ali Baba (109)
* Display items available for borrowing in Gombak
* Display user ID, name, and address of users who lend and borrow at the same time
* List all items (names) borrowed by Alaa Mohammed with lender’s ID and name
* Remove users that are neither borrowing nor lending
* Modify rating for Emad Salem based on the ratings records
* Modify number of borrowings for Nada Salem based on the borrowing records
* Insert a new user as a borrower

## Procedures
The SQL procedures used in borrowingItems_procedures.sql are:
* Request to borrow an item
* Summarize user profile (biodata, items borrowed/lent)

## Functions
The SQL statements used in borrowingItems_functions.sql are:
* How many days left for a borrowed item?
* Modify all ratings of a specific user based on rating table
