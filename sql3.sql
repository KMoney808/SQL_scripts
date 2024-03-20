
/* 
this stored proc is using micrsoft ADVENTUREWORKS2019 database 
to run this script, you will need to install this database on your personal computer
this SQL script is written in SSMS

*/

USE AdventureWorks2019  --to specify which master database name or schema name to use

SELECT   PP.[ProductID]  --need to specify which table & column
		,PP.[ProductNumber]
		,[Name]
		,MAX(PCH.[StandardCost]) AS MAX_StandardCost --want max standardcost
		,PCH.[ModifiedDate]
INTO #table1 --inserting result into tempt table for viewing later
FROM [Production].[Product] AS PP
	INNER JOIN [Production].[ProductCostHistory] AS PCH
		ON PP.[ProductID] = PCH.ProductID
GROUP BY PP.[ProductID], PP.[ProductNumber], [Name], PCH.[ModifiedDate]


SELECT * FROM #table1 --to view tempt table1


/* CONVERT DATETIME format to YYYYMMDD */

SELECT [ProductID]
		,CONVERT(CHAR(8), [ModifiedDate], 112) AS [MOD_DATE]--converting datetime to this specific format and to CHAR
FROM AdventureWorks2019.[Production].[Product]