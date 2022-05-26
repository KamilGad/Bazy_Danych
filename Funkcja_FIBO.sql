--Polecenie
--Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako 
--argument wejœciowy liczbê n. Generowanie ci¹gu Fibonacciego musi zostaæ 
--zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.

--Tworzenie funkcji wywo³ywanej w procedurze 
ALTER FUNCTION Fibex (@n INT)
RETURNS INT 
AS
--PRINT 'Oto ci¹g Fibbonacciego: '
BEGIN 
	--Zadeklarownie zmiennych
	DECLARE @a INT
	DECLARE @b INT
	DECLARE @c INT
	DECLARE @i INT

	--Ustawienie wartoœci 
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