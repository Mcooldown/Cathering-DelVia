--1
SELECT a.[Name],a.StaffPositionName, [Total Activity] = COUNT(*)
FROM(
	SELECT [ActivityID] = hpt.ID,StaffID,st.[Name],StaffPositionName = p.[Name],Salary
	FROM HeaderPurchaseTransaction hpt
	JOIN Staff st ON st.ID = hpt.StaffID
	JOIN Position p ON st.PositionID = p.ID
	UNION
	SELECT hst.ID,StaffID, st.[Name],StaffPositionName = p.[Name],st.Salary
	FROM HeaderServiceTransaction hst
	JOIN Staff st ON st.ID = hst.StaffID
	JOIN Position p ON st.PositionID = p.ID) AS a
WHERE a.Salary BETWEEN 1000000 AND 4000000 
GROUP BY a.[Name],a.StaffPositionName
HAVING COUNT(*)>2

--2
SELECT [CustomerID] = c.ID, [CustomerName] = c.[Name], [Pax Bought] = SUM(dst.MenuQuantity) 
FROM Customer c
INNER JOIN HeaderServiceTransaction as hst ON c.ID = hst.CustomerID
INNER JOIN DetailServiceTransaction as dst ON hst.ID = dst.TransactionID
INNER JOIN Menu as m ON dst.MenuID = m.ID
WHERE c.Gender = 'Male' AND DATEPART(MONTH, hst.TransactionDate) BETWEEN 1 AND 6
GROUP BY c.ID, c.[Name]

--3
SELECT [IngredientName] = i.[Name], [Ingredient Bought] = SUM(dpt.IngredientsQuantity), [Purchase Count] = COUNT(dpt.PurchaseID), [Total Expenses] = SUM(dpt.IngredientsQuantity * i.Price) 
FROM Ingredients i
INNER JOIN DetailPurchaseTransaction as dpt ON i.ID = dpt.IngredientsID
INNER JOIN HeaderPurchaseTransaction as hpt ON dpt.PurchaseID = hpt.ID
WHERE DATEPART(MONTH, hpt.PurchaseDate) % 2 = 0 AND DATEPART(DAY, hpt.PurchaseDate) BETWEEN 2 AND 5 
GROUP BY i.[Name]

--4
SELECT	LEFT(st.[Name],CHARINDEX(' ',st.[Name])-1) AS [First Name],
		COUNT(TransactionID) AS [Transaction Count],
		SUM(MenuQuantity) AS [Pax Sold]
FROM Staff St
JOIN HeaderServiceTransaction HST
ON St.ID = HST.StaffID
JOIN DetailServiceTransaction DST
ON HST.ID = DST.TransactionID
WHERE RIGHT(St.ID, 3) % 2 != 0 AND RIGHT(HST.CustomerID, 3) % 2 = 0
GROUP BY St.[Name]

--5
SELECT REPLACE(Vr.[Name],'PT.','') AS [Vendor Name], 
	   Ig.[Name] AS IngredientName,
	   'Rp.' + CONVERT(VARCHAR(255), Ig.Price) AS IngredientPrice
FROM (
	SELECT AVG(Price) AS AvgPrice
	FROM Ingredients Ig
) AS RN, Vendor Vr
JOIN HeaderPurchaseTransaction HPT
ON Vr.ID = HPT.VendorID
JOIN DetailPurchaseTransaction DPT
ON HPT.ID = DPT.PurchaseID
JOIN Ingredients Ig
ON DPT.IngredientsID = Ig.ID
WHERE Stock < 250
	AND Price >= RN.AvgPrice

--6
SELECT  [CustomerName] = c.[Name],
		[TransactionDate] = CONVERT(VARCHAR,hst.TransactionDate,107),
		[MenuName] = m.[Name],
		[MenuPrice] = m.Price,
		[Brief Description] = (SELECT CASE WHEN LEN(Description)-LEN(REPLACE(Description,' ', ''))<2
		THEN Description
		ELSE LEFT(Description, CHARINDEX(' ', Description, CHARINDEX(' ', Description)+1)) END),
		[TotalPrice] = dst.MenuQuantity * m.Price
FROM (SELECT AVG(Price) AS Average FROM Menu) AS test,
Customer c
JOIN HeaderServiceTransaction hst
ON hst.CustomerID = c.ID
JOIN DetailServiceTransaction dst
ON dst.TransactionID = hst.ID
JOIN Menu m
ON m.ID = dst.MenuID
WHERE m.Price > test.Average AND dst.MenuQuantity > 100

--7
SELECT 
	UPPER(s.Name) AS [Staff Name],
	CONVERT(VARCHAR,hpt.PurchaseDate,107) AS PurchaseDate,
	CAST(SUM(dpt.IngredientsQuantity)AS VARCHAR) + ' Pcs' AS QuantityBought
FROM  (SELECT MAX(Price) as MaxPrice FROM Ingredients) AS mx,
	  Staff s
JOIN HeaderPurchaseTransaction hpt
ON hpt.StaffID = s.ID
JOIN DetailPurchaseTransaction dpt
ON dpt.PurchaseID = hpt.ID
JOIN Ingredients i
ON i.ID = dpt.IngredientsID
WHERE MONTH(PurchaseDate)%2=0 AND i.Price<mx.MaxPrice
GROUP BY s.[Name],hpt.PurchaseDate

--8
SELECT
	[CustomerName] = cs.[Name],
	[Email] = LEFT(cs.Email,CHARINDEX('@',cs.Email)-1),
	[Menu Name] = LOWER(me.[Name]),
	[Pax Bought] = SUM(MenuQuantity)
FROM (
	SELECT AVG(MenuQuantity) AS Average FROM DetailServiceTransaction
) AS a,
HeaderServiceTransaction hst
JOIN Customer cs ON cs.ID = hst.CustomerID
JOIN DetailServiceTransaction dst ON dst.TransactionID = hst.ID
JOIN Menu me ON me.ID = dst.MenuID
WHERE cs.Gender = 'Male'
GROUP BY cs.[Name],cs.Email,me.[Name],dst.MenuID,Average
HAVING SUM(MenuQuantity) >= a.Average

--9
CREATE VIEW LoyalCustomerView
AS
SELECT 
	CustomerName = cs.[Name],
	[Total Transaction] = COUNT(CustomerID),
	[Total Pax Purchased] = SUM(MenuQuantity),
	[Total Price] = SUM(MenuQuantity*Price)
FROM HeaderServiceTransaction hst
JOIN Customer cs ON cs.ID = hst.CustomerID
JOIN DetailServiceTransaction dst ON dst.TransactionID = hst.ID
JOIN Menu me ON me.ID = dst.MenuID
WHERE Gender = 'Female'
GROUP BY cs.[Name]
HAVING COUNT(CustomerID)>2

-- 10
CREATE VIEW VendorRecapView
AS
SELECT 
	VendorName = ve.[Name],
	[Purchases Made] = COUNT(VendorID),
	[Ingredients Purchased] = SUM(IngredientsQuantity)
FROM HeaderPurchaseTransaction hpt
JOIN Vendor ve ON ve.ID = hpt.VendorID
JOIN DetailPurchaseTransaction dpt ON dpt.PurchaseID = hpt.ID
JOIN Ingredients ing ON ing.ID = dpt.IngredientsID
WHERE Stock > 150
GROUP BY ve.[Name]
HAVING COUNT(*)>1
