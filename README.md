# Fall2019_Enterprise_Systems_Info_Modeling_Assignment3
Graduate level enterprise systems-info modeling course SQL assignment

*Instructions*<br>
Execute Bank.sql (included with this document) in MySQL and confirm that the resulting database matches the schema shown in BankSchema.doc.  Write queries that answer thefollowing questions and save them in a single .sql file, which you will upload to Blackboard asyour assignment submission.  Label each query with a commented out line indicating whichquestion is being answered.    You do not have to save the outputs of the queries, but I willexecute your script on my machine to verify it performs the tasks as expected.  Bonus points will be awarded if your entire script runs start to finish without errors. 
1. How many employees work for the bank? 
2. List the First Name, Last name, Title, and Start Date for all employees.
3. Create a list of all employees who are tellers and order by start date – list first name, last name.
4. Write a query that counts how many employees work at headquarters.
5. Create a list of all employees that work at Headquarters. List first name, last name, title.
6. List branch name and number of total number of employees for each branch.
7. List all the different product type codes from the product table.
8. List the product name for all the products that contain the word “account.”
9. List the first name, last name and birthdate of all individual customers. Order by birthdate ascending.
10. Retrieve the average, minimum and maximum available balances for all accounts.
11. Retrieve the product cd, average, minimum and maximum available balance for each type of account.
12. List customer ID, total number of accounts where the balance is greater than $1000.
13. List customer ID, total number of accounts, average balance where the balance is greater than $1000.
14. List customer ID, total number of accounts, average balance for each customer where the average balance for a customer is greater than $1000.
15. List the maximum pending balance by open branch ID, product code where the maximum pending balance is greater than 2000.
16. List the maximum pending balance by open branch name, product name where the maximum pending balance is greater than 2000.
17. For each account whose available balance is below the average of all available balances, retrieve the account ID, customer ID, product code and opening branch id.
18. For each account whose available balance is below the average of all available balances, retrieve the account ID, customer last name, customer first name, product name and opening branch name (use individual customer table). Order by customer last name. 
19. For each individual customer that has more than two accounts, retrieve the customer last name, first name.
20. For each employee, list their last name, first name, number of years with company (using today’s date and a column heading of ‘years with company’) and their supervisor’s last name. Order by supervisor last name.   The “CURDATE()” function will be useful here.
21. For each supervisor, list their last name (use the column heading ‘Supervisor last name’) and the number of employees supervised (use the column heading ‘Number of employees’)
22. Retrieve all records for open back accounts.  “IS NULL” will be useful here.
23. Return all records from the account table where there are no records in the acc_transaction table for the given account ID.
24. Create a View, ‘ACTIVE_ACCOUNTS’, for all records from the account table where there are records in the acc_transaction table for the given account ID.
25. For all active accounts, list the product code and the average, minimum and maximum available balances. 
