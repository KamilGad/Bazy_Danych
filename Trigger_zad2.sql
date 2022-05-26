-- =============================================
-- Author:		Ja
-- Create date: 25.05.2022
-- Description:	Trigger ma za zadanie modyfikow� wprowadzony atrybut (nazwisko), tak aby by�o zapisane wielkimi literami 
-- =============================================
USE AdventureWorks2019
GO
	CREATE TRIGGER UPlettt 
    ON  Person.Person
	AFTER INSERT  -- after insert bo dokonuj� modyfikacji wprowadzoneych danych (czyli po funkcji insert) 
	AS 
		BEGIN
		--PRINT 'Dzia�am :))'
		--SELECT UPPER(LastName) FROM Person.Person
		UPDATE Person.Person SET LastName = UPPER(LastName)

		--to bierze nowo wprowadzona osob� 
		WHERE  Person.BusinessEntityID IN (SELECT BusinessEntityID FROM inserted)
		END
	GO

INSERT INTO Person.Person (BusinessEntityID, PersonType, FirstName, LastName) VALUES(20782, 'IN', 'Jan', 'Kowalski')
SELECT * FROM Person.Person

--dodanie id, bo ie da sie insertowac bez tego
INSERT INTO Person.BusinessEntity(rowguid) VALUES(NewID()) 
SELECT * FROM Person.BusinessEntity