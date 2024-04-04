/* 
STORED PROC to use partition by to aggregate different columns 
partition by reduces the extra line of group by when doing aggregations
and improves query performance 
*/

--examples of partition by for aggregations
SELECT [PurchaseOrderID]
		,AVG([TotalDue]) OVER (PARTITION BY [VendorID]) AS AVG_TOTALDUE
		,MAX([TaxAmt]) OVER (PARTITION BY [VendorID]) AS MAX_TAXAMT
FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]


--examples of row number to find the most recent orders
SELECT [PurchaseOrderID]
		,[VendorID] 
		,[OrderDate]
		,ROW_NUMBER() OVER(PARTITION BY [VendorID] ORDER BY [OrderDate] DESC) AS RECENT_ORDERDATE
FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]

--example rank over to find the ranking of the data rows and gives the same ranking for row/values that ties
--does not return subsequence numbers unlike row number
SELECT [PurchaseOrderID]
		,[VendorID] 
		,[EmployeeID]
		,RANK() OVER(PARTITION BY [EmployeeID] ORDER BY [SubTotal] DESC) AS SALES_RANKING
FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]
