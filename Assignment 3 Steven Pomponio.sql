USE bank;

-- Query 1
SELECT COUNT(*) 'Total No. of Employees'
FROM employee;

-- Query 2
SELECT FIRST_NAME
	, LAST_NAME
    , TITLE
    , START_DATE
FROM employee;

-- Query 3
SELECT FIRST_NAME
	, LAST_NAME
FROM employee
WHERE TITLE = 'Teller'
ORDER BY START_DATE;

-- QUERY 4
SELECT COUNT(*) 'No. of employees at Headquarters'
FROM employee
WHERE ASSIGNED_BRANCH_ID = 1;

-- QUERY 5
SELECT FIRST_NAME
	, LAST_NAME
	, TITLE
FROM employee
WHERE ASSIGNED_BRANCH_ID = 1;

-- QUERY 6
SELECT b.NAME 'Branch Name'
	, count(e.EMP_ID) 'No. of Employees'
From branch b
	, employee e 
WHERE b.BRANCH_ID = e.ASSIGNED_BRANCH_ID
GROUP BY b.NAME;

-- QUERY 7
SELECT DISTINCT PRODUCT_TYPE_CD
FROM product;

-- QUERY 8
SELECT NAME 'Product Name'
FROM PRODUCT
WHERE NAME LIKE '%account%';

-- QUERY 9
SELECT FIRST_NAME
	, LAST_NAME
    , BIRTH_DATE
FROM individual
ORDER BY BIRTH_DATE;

-- QUERY 10
SELECT ROUND(AVG(AVAIL_BALANCE),2) 'Average Available Balance'
	, ROUND(MIN(AVAIL_BALANCE),2) 'Minimum Available Balance'
    , ROUND(MAX(AVAIL_BALANCE),2) 'Maximum Available Balance'
FROM account;

-- QUERY 11
SELECT PRODUCT_CD
	, ROUND(AVG(AVAIL_BALANCE),2) 'Average Available Balance'
	, ROUND(MIN(AVAIL_BALANCE),2) 'Minimum Available Balance'
    , ROUND(MAX(AVAIL_BALANCE),2) 'Maximum Available Balance'
FROM account
GROUP BY PRODUCT_CD;

-- QUERY 12
SELECT CUST_ID
	, COUNT(*) 'No. of Accounts Over $1000'
FROM account
WHERE AVAIL_BALANCE > 1000
GROUP BY CUST_ID;

-- QUERY 13
SELECT CUST_ID
	, COUNT(*) 'No. of Accounts Over $1000'
    , ROUND(AVG(AVAIL_BALANCE),2) 'Average Available Balance'
FROM account
GROUP BY CUST_ID
HAVING AVG(AVAIL_BALANCE) > 1000;

-- QUERY 14
SELECT CUST_ID
	, COUNT(*) 'No. of Accounts Over $1000'
    , ROUND(AVG(AVAIL_BALANCE),2) 'Average Available Balance'
FROM account
WHERE AVAIL_BALANCE > 1000
GROUP BY CUST_ID;

-- Query 15
SELECT OPEN_BRANCH_ID
	, PRODUCT_CD
    , ROUND(MAX(PENDING_BALANCE),2) 'Maximum Pending Balance'
FROM account
GROUP BY OPEN_BRANCH_ID
	, PRODUCT_CD
HAVING MAX(PENDING_BALANCE) > 2000;

-- Query 16
SELECT b.NAME 'Branch Name'
	, p.NAME 'Product Name'
    , ROUND(MAX(a.PENDING_BALANCE),2) 'Maximum Pending Balance'
FROM account a
	, branch b
    , product p
WHERE a.OPEN_BRANCH_ID = b.BRANCH_ID
	AND a.PRODUCT_CD = p.PRODUCT_CD
GROUP BY a.OPEN_BRANCH_ID
	, a.PRODUCT_CD
HAVING MAX(a.PENDING_BALANCE) > 2000;

-- Query 17
SELECT ACCOUNT_ID
	, CUST_ID
    , PRODUCT_CD
    , OPEN_BRANCH_ID
FROM account
WHERE AVAIL_BALANCE >
	(SELECT AVG(AVAIL_BALANCE)
    FROM account);

-- Query 18
SELECT a.ACCOUNT_ID
	, i.LAST_NAME
    , i.FIRST_NAME
    , p.NAME PRODUCT_NAME
    , b.NAME BRANCH_NAME
FROM account a
	, individual i
    , product p
    , branch b
WHERE a.CUST_ID = i.CUST_ID
	AND a.PRODUCT_CD = p.PRODUCT_CD
    AND a.OPEN_BRANCH_ID = b.BRANCH_ID
	AND a.AVAIL_BALANCE >
		(SELECT AVG(AVAIL_BALANCE)
    FROM account)
ORDER BY i.LAST_NAME;

-- Query 19
SELECT i.LAST_NAME
    , i.FIRST_NAME
FROM account a
	, individual i
WHERE a.CUST_ID = i.CUST_ID
GROUP BY a.CUST_ID
having count(*) > 1;

-- Query 20
SELECT e1.LAST_NAME 'Employee Last Name'
	, e1.FIRST_NAME 'Employee First Name'
    , TIMESTAMPDIFF(YEAR, e1.START_DATE, CURDATE()) 'Years With Company'
    , e2.LAST_NAME 'Supervisor Last Name'
FROM employee e1
LEFT JOIN employee e2
ON e2.EMP_ID = e1.SUPERIOR_EMP_ID
ORDER BY e2.LAST_NAME;

-- Query 21
SELECT e2.LAST_NAME 'Supervisor Last Name'
	, count(*) 'Number of Employees'
FROM employee e1
JOIN employee e2
ON e2.EMP_ID = e1.SUPERIOR_EMP_ID
GROUP BY e2.LAST_NAME;

-- Query 22
SELECT *
FROM account
WHERE CLOSE_DATE IS NULL;

-- Query 23
SELECT *
FROM account
WHERE ACCOUNT_ID NOT IN (SELECT Account_ID FROM acc_transaction);

-- Query 24
CREATE VIEW ACTIVE_ACCOUNTS AS
	SELECT *
	FROM account
	WHERE ACCOUNT_ID IN (SELECT Account_ID FROM acc_transaction);
		
-- Query 25
SELECT PRODUCT_CD
	, ROUND(AVG(AVAIL_BALANCE),2) 'Average Available Balance'
    , ROUND(MIN(AVAIL_BALANCE),2) 'Minimum Available Balance'
    , ROUND(MAX(AVAIL_BALANCE),2) 'Maximum Available Balance'
FROM active_accounts
GROUP BY PRODUCT_CD;