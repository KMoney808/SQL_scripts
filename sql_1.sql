/* 
this is an example sql procedure that will 
select for specific columns and inventories in the production table
counting the number of inventories available 

*/

SELECT 	[PRODUCT PRICES]
		,ORDER.[ORDER ID]   --need to specific which table and column
		,[ORDER DATE]
		,COUNT(PRODUCT COLOR) AS [COUNT_PRODUCT_COLOR]  --count the number of colors
FROM PRODUCT
    INNER JOIN ORDER  --to find where they intersect on the primary key
        ON PRODUCT.PRODUCT ID = ORDER.PRODUCT ID  --join on primary key
WHERE [ORDER STAGE] = 'COMPLETE'
	AND [PRODUCT PRICE] > 100
     AND [PRODUCT COLOR] = 'BLUE' --want to check for blue population
	AND [PRODUCT COLOR] != 'RED'  --no red 
HAVING [COUNT_PRODUCT_COLOR] >= 2 --number of blue is atleast 2
