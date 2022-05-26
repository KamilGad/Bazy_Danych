
CREATE PROCEDURE FibexGO @n INT
AS
BEGIN
	DECLARE 
	@i INT = 0,
	@limit INT

	WHILE @i <= @n
	BEGIN
		SET @limit = dbo.Fibex(@i) 
		PRINT 'Numer iteracji: ' + CONVERT(VARCHAR, @i) + '		Wartoœæ w ci¹gu: ' + CONVERT(VARCHAR, @limit)
		SET @i = @i + 1
	END
END

EXEC FibexGO 10






	
	 

	





