--Polecenie
--Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako 
--argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta� 
--zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.

--Tworzenie funkcji wywo�ywanej w procedurze 
ALTER FUNCTION Fibex (@n INT)
RETURNS INT 
AS
--PRINT 'Oto ci�g Fibbonacciego: '
BEGIN 
	--Zadeklarownie zmiennych
	DECLARE @a INT
	DECLARE @b INT
	DECLARE @c INT
	DECLARE @i INT

	--Ustawienie warto�ci 
	SET  @a = 0
	SET  @b = 1
	SET  @c = 0
	SET  @i = 0

	WHILE @i < @n
	BEGIN
		SET @c = @a+@b
		SET @a = @b
		SET @b = @c
		--iterator
		SET @i= @i+1
	END
	RETURN @c
END