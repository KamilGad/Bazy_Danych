--Zadanie1
WITH TempEmployeeInfo
AS 
(
	SELECT 
		Profile.BusinessEntityID AS BusinessEntityID , -- Person.Person
		Profile.FirstName,
		Profile.LastName, 
		AD2.AddressLine1 AS Address, --Person.Adress
		AD2.City,
		PY.Rate --EmployeePayHistory

	FROM Person.Person AS Profile
		INNER JOIN Person.BusinessEntityAddress AS AD1
			ON Profile.BusinessEntityID = AD1.BusinessEntityID
		INNER JOIN Person.Address AS AD2
			ON AD1.AddressID = AD2.AddressID
		RIGHT JOIN HumanResources.EmployeePayHistory AS PY
			ON Profile.BusinessEntityID = PY.BusinessEntityID
)

SELECT * FROM TempEmployeeInfo;



SELECT * FROM Sales.Customer
SELECT * FROM Sales.SalesOrderHeader
--Zadanie2
WITH SALE_CTE
AS
(
	SELECT 
		Customer.CompanyName AS CompanyConatact,
		Revenue

	FROM Sales.SalesOrderHeader AS SL
		INNER JOIN Sales.Customer AS Cu
			ON SL.CustomerID = Cu.CustomerID

)

SELECT * FROM SALE_CTE


--Zadanie2
WITH SALE_CTE
AS
(
	SELECT 	
		Customer.CompanyName+ ' (' + FirstName + ' ' + LastName + ')' AS CompanyConatact,
		SalesOrderHeader.TotalDue AS Revenue

	FROM SalesLT.SalesOrderHeader
		INNER JOIN SalesLT.Customer 
			ON Customer.CustomerID = SalesOrderHeader.CustomerID
)

SELECT * AS Revenue FROM SALE_CTE


--Zadanie3
WITH ProductSales_CTE
AS
(
	SELECT
	Name AS Category,
	CAST(SUM(SD.LineTotal) AS MONEY) AS SalesValue

	FROM SalesLT.SalesOrderDetail AS SD

		INNER JOIN SalesLT.Product AS PR
			ON SD.ProductCategoryID = PR.ProductCategoryID

		INNER JOIN SalesLT.SalesOrderDetail OD
			ON  PR.SalesOrderDetail.ProductID = OD.ProductID
)
GROUP BY Name
SELECT * FROM ProductSales_CTE