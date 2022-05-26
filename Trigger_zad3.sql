
USE [AdventureWorks2019]
GO
-- =============================================
-- Create date: 25.05.22r.
-- Description: Trigger wyœwietla informacjê o b³êdzie, jeœli zmiana wartoœci w polu TAXRATE bêdzie wiêksza ni¿ 30%.
-- =============================================
CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate
	INSTEAD OF UPDATE
	AS
	DECLARE @NewTaxR int, @TaxR int
	SELECT @NewTaxR = TaxRate FROM inserted
	SELECT @TaxR = TaxRate FROM deleted
		IF (@NewTaxR > 1.3*@TaxR)
			BEGIN
				raiserror('The value of TaxRate was modified more than 30% of the previous value',16, 1)
			END
		ELSE
			BEGIN
				UPDATE Sales.SalesTaxRate
				SET TaxRate = (SELECT TaxRate FROM inserted)
				WHERE SalesTaxRateID = (SELECT SalesTaxRateID FROM inserted)
			END


SELECT * FROM Sales.SalesTaxRate

DROP TRIGGER taxRateMonitoring  ON ALL SERVER;



UPDATE Sales.SalesTaxRate 
SET TaxRate =  8
WHERE SalesTaxRateID = 6;

