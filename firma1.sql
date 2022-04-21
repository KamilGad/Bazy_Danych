--CREATE SCHEMA ksiegowosc;
CREATE SCHEMA ksiegowosc;

--tworzenie tabeli pracownicy
CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika int PRIMARY KEY NOT NULL,
	imi� varchar(30),
	nazwisko varchar(30) NOT NULL,
	adres varchar(30),
	telefon char(9) NOT NULL
);


--tworzenie tabeli godziny
CREATE TABLE ksiegowosc.godziny (
	id_godziny int PRIMARY KEY NOT NULL,
	data date NOT NULL, 
	liczba_godzin int NOT NULL,
	id_pracownika int NOT NULL,
);

--tworzenie tabeli pensja
CREATE TABLE ksiegowosc.pensja(
	id_pensji int PRIMARY KEY NOT NULL,
	stanowisko varchar(30),
	kwota money NOT NULL,
);

--tworzenie tabeli premia
CREATE TABLE ksiegowosc.premia(
	id_premii int PRIMARY KEY NOT NULL,
	rodzaj varchar(30),
	kwota money NOT NULL
);

--tworzenie tabeli wynagrodzenie 
CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia int PRIMARY KEY NOT NULL,
	data date NOT NULL,
	id_pracownika int NOT NULL,
	id_godziny int NOT NULL,
	id_pensji int NOT NULL,
	id_premii int NOT NULL
);

--usuwanie tabel 
drop table ksiegowosc.pracownicy;
drop table ksiegowosc.godziny;
drop table ksiegowosc.premie;
drop table ksiegowosc.pensje;
drop table ksi�gowosc.wynagrodzenia;

--dodawanie kluczy obcych
ALTER TABLE ksiegowosc.godziny 
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny (id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja (id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia (id_premii);

--Dodanie komentarzy 
--Tabela pracownicy
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Pracownicy firmy, kluczem g��wnym jest atrybut id_pracownika, nie ma tu �adnych kluczy obcych.';

--tabela godziny
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela zawieraj�ca informacj� na temat przepracowanych godzin, konktretnych pracownik�w. Kluczem g��wnym jest id_pensji, a kluczem obcym id_pracownika.';

--tabela pensja
COMMENT ON TABLE ksiegowosc.pensja IS 'Pensje przypadaj�ce na konkretne stanowisko, klucz podstawoy - id_pensji, brak kluczy obcych';

--tabela premia
COMMENT ON TABLE ksiegowosc.premia IS 'Premie, klucz podstawowy - id_premii, brak kluczy obcych';

--tabela wynagrodzenie
COMMENT ON TABLE ksiegowosc.wynagrodzenia IS 'Tabela ��czaca, kluczem podstawowym jest id_wynagrodzenia, klucze obce to: id_pracownika, id_godziny, id_pensji i id_premii';
 --EXEC sp_addextendedproperty pracownicy  'Pracownicy firmy, kluczem g��wnym jest atrybut id_pracownika, nie ma tu �adnych kluczy obcych ';
 

--wprowadzanie rekord�w
--do pracownikow
INSERT INTO ksiegowosc.pracownicy VALUES(0, 'Agnieszka', 'Zozol', 'Ul.J. Popie�uszki 1', '544762987');
INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Grzegorz','Bard','Al.A.Mickiewicza 44','799812532');
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'El�bieta','Wyrwiz�b','Ul.Bazarkowa 65','666999766');
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Jan','Paper','Al.Jana Paw�a II 2a','700090807');
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Tomasz','Nicpo�','Ul.Og�rkowa 21/3','791235672');
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Zofia','Lipa','Ul.Szcz�liwa 13','566812952');
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Paulina','Skrzypek','Ul.Bawe�niana 34','543769245');
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Ryszard','Fedor','Ul.Janko Muzykanta 1','500707890');
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Iwona','Nowak','Ul.Poziomkowa 4','786544200');
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Micha�','Molenda','Ul.Sezamkowa 67/122','548766900');
SELECT * FROM ksiegowosc.pracownicy


--do godzin
INSERT INTO ksiegowosc.godziny VALUES(0,'2022-03-10', 160,0);
INSERT INTO ksiegowosc.godziny VALUES(1,'2022-03-10', 86,1);
INSERT INTO ksiegowosc.godziny VALUES(2,'2022-03-10', 176,2);
INSERT INTO ksiegowosc.godziny VALUES(3,'2022-03-10', 122,3);
INSERT INTO ksiegowosc.godziny VALUES(4,'2022-03-10', 126,4);
INSERT INTO ksiegowosc.godziny VALUES(5,'2022-03-10', 80,5);
INSERT INTO ksiegowosc.godziny VALUES(6,'2022-03-10', 178,6);
INSERT INTO ksiegowosc.godziny VALUES(7,'2022-03-10', 108,7);
INSERT INTO ksiegowosc.godziny VALUES(8,'2022-03-10', 160,8);
INSERT INTO ksiegowosc.godziny VALUES(9,'2022-03-10', 169,9);
SELECT * FROM ksiegowosc.godziny;

--do premii
INSERT INTO ksiegowosc.premia VALUES(0,'Najmniej wypitych kaw',100);
INSERT INTO ksiegowosc.premia VALUES(1,'Najefektywniejszy pracownik',300);
INSERT INTO ksiegowosc.premia VALUES(2,'Najwi�cej nadgodzin',150);
INSERT INTO ksiegowosc.premia VALUES(3,'Najmilszy pracownik',250);
INSERT INTO ksiegowosc.premia VALUES(4,'Pracownik bez sp�nienia',10);
INSERT INTO ksiegowosc.premia VALUES(5,'Pracownik zachowuj�cy deadliny',50);
INSERT INTO ksiegowosc.premia VALUES(6,'Bez samochodu',100);
INSERT INTO ksiegowosc.premia VALUES(7,'Sfinalizowanie projektu',350);
INSERT INTO ksiegowosc.premia VALUES(8,'Opieka nad sta�ystami',200);
INSERT INTO ksiegowosc.premia VALUES(9, 'Brak premii', 0);
SELECT * FROM ksiegowosc.premia;

--do pensji
INSERT INTO ksiegowosc.pensja VALUES(0, 'Analityk', 4500);
INSERT INTO ksiegowosc.pensja VALUES(1, 'Sta�ysta', 1200);
INSERT INTO ksiegowosc.pensja VALUES(2, 'Sekretarka', 3000);
INSERT INTO ksiegowosc.pensja VALUES(3, 'Programista', 5000);
INSERT INTO ksiegowosc.pensja VALUES(4, 'Programista', 5000);
INSERT INTO ksiegowosc.pensja VALUES(5, 'Sprz�taczka', 2500);
INSERT INTO ksiegowosc.pensja VALUES(6, 'Administrator', 6500);
INSERT INTO ksiegowosc.pensja VALUES(7, 'Analityk', 5700);
INSERT INTO ksiegowosc.pensja VALUES(8, 'Programista', 5800);
INSERT INTO ksiegowosc.pensja VALUES(9, 'Sta�ysta', 3000);
SELECT * FROM ksiegowosc.pensja;

--do wynagrodzenia
INSERT INTO ksiegowosc.wynagrodzenie VALUES (0, '2022-03-10', 0, 0, 0, 1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (1, '2022-03-10', 1, 1, 1, 6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2, '2022-03-10', 2, 2, 2, 0);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3, '2022-03-10', 3, 3, 3, 5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4, '2022-03-10', 4, 4, 4, 8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5, '2022-03-10', 5, 5, 5, 0);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6, '2022-03-10', 6, 6, 6, 9);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7, '2022-03-10', 7, 7, 7, 6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8, '2022-03-10', 8, 8, 8, 4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9, '2022-03-10', 9, 9, 9, 4);
SELECT * FROM ksiegowosc.wynagrodzenie;

--Zadanie 6a -> wy�wietlanie id_pracownika i nazwisk
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--Zadanie 6b -> wy�wietlenie id pracownikow, kt�rych p�aca jest wi�ksza ni� 1000
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensja  
ON wynagrodzenie.id_pensji = pensja.id_pensji 
WHERE ksiegowosc.pensja.kwota > 1000;
SELECT * FROM ksiegowosc.wynagrodzenie;

--Zadanie 6c -> Wy�wietlenie id pracownik�w nieposiadaj�cych premii, kt�rych p�aca jest wi�ksza ni� 2000
SELECT id_pracownika FROM ((ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji)
INNER JOIN ksiegowosc.premia
ON wynagrodzenie.id_premii = premia.id_premii)
WHERE ksiegowosc.pensja.kwota > 2000 AND ksiegowosc.premia.kwota = 0;

--Zadanie 6d ->  Wy�wietl pracownik�w, kt�rych pierwsza litera imienia zaczyna si� na liter� �J�
SELECT * FROM ksiegowosc.pracownicy
WHERE imi� LIKE 'J%';

--Zadanie 6e -> Wy�wietl pracownik�w, kt�rych nazwisko zawiera liter� �n� oraz imi� ko�czy si� na liter� �a�
SELECT *
FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%a' OR nazwisko LIKE 'N%a'; --tu nie wiem czy tak powinno by�???

--Zadanie 6f1 ->  Wy�wietl imi� i nazwisko pracownik�w oraz liczb� ich nadgodzin, przyjmuj�c, i� standardowy czas pracy to 160 h miesi�cznie. 
SELECT imi�, nazwisko, (liczba_godzin - 160) AS liczba_nadgodzin FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.godziny 
ON pracownicy.id_pracownika = godziny.id_pracownika
WHERE liczba_godzin > 160 

--Zadanie 6g1 ->  Wy�wietl imi� i nazwisko pracownik�w, kt�rych pensja zawiera si� w przedziale 1500 � 3000 PLN.
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji 
WHERE ksiegowosc.pensja.kwota BETWEEN 1500 AND 3000;

--Zadanie 6h1 -> Wy�wietl imi� i nazwisko pracownik�w, kt�rzy pracowali w nadgodzinach i nie otrzymali premii
SELECT imi�, nazwisko, (liczba_godzin - 160) AS liczba_nadgodzin FROM (((ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.godziny 
ON pracownicy.id_pracownika = godziny.id_pracownika)
INNER JOIN ksiegowosc.wynagrodzenie 
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika)
INNER JOIN ksiegowosc.premia
ON wynagrodzenie.id_premii = premia.id_premii)
WHERE liczba_godzin > 160 AND ksiegowosc.premia.kwota = 0;

--Zadanie 6i ->  Uszereguj pracownik�w wed�ug pensji.
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji 
ORDER BY ksiegowosc.pensja.kwota;

--Zadanie 6j -> Uszereguj pracownik�w wed�ug pensji i premii malej�co
SELECT imi�, nazwisko FROM (((ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika)
INNER JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji)
INNER JOIN ksiegowosc.premia
ON wynagrodzenie.id_premii = premia.id_premii)
ORDER BY ksiegowosc.pensja.kwota, ksiegowosc.premia.kwota DESC;

--Zadanie 6k -> Zlicz i pogrupuj pracownik�w wed�ug pola �stanowisko�
SELECT stanowisko, COUNT(stanowisko) AS Ilo�� FROM ksiegowosc.pensja
GROUP BY ksiegowosc.pensja.stanowisko;

--Zadanie 6l -> Policz �redni�, minimaln� i maksymaln� p�ac� dla stanowiska �kierownik� (je�eli takiego nie masz, to przyjmij dowolne inne)
SELECT AVG(kwota) AS '�rednia kwota dla programisty',
 MIN(kwota) AS 'Minimalna kwota dla programisty',
 MAX(kwota) AS 'Maksymalna kwota dla programisty' FROM ksiegowosc.pensja
 WHERE stanowisko = 'Programista';

--Zadanie 6m ->  Policz sum� wszystkich wynagrodze�
SELECT sum(kwota) AS 'Suma wszytskich wynagrodze�' FROM ksiegowosc.pensja

--Zadanie 6f2 ->  Policz sum� wynagrodze� w ramach danego stanowiska
SELECT stanowisko, COUNT(stanowisko) AS Ilo�� ,sum(kwota) AS 'Suma pensji na danym stanowisku' FROM ksiegowosc.pensja
GROUP BY ksiegowosc.pensja.stanowisko;

--Zadanie 6g2 ->  Wyznacz liczb� premii przyznanych dla pracownik�w danego stanowiska
SELECT stanowisko, COUNT(premia.rodzaj) AS 'Suma pensji na danym stanowisku' FROM ((ksiegowosc.premia
INNER JOIN ksiegowosc.wynagrodzenie
ON premia.id_premii = wynagrodzenie.id_premii)
INNER JOIN ksiegowosc.pensja
ON pensja.id_pensji = wynagrodzenie.id_pensji)
GROUP BY ksiegowosc.pensja.stanowisko;

--Zadanie 6h2 -> Usu� wszystkich pracownik�w maj�cych pensj� mniejsz� ni� 1200 z�.
ALTER TABLE ksiegowosc.godziny DROP CONSTRAINT FK__godziny__id_prac__2C3393D0;
ALTER TABLE ksiegowosc.wynagrodzenie DROP CONSTRAINT FK__wynagrodz__id_pr__2D27B809;

DELETE pracownicy FROM ((ksiegowosc.pracownicy
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji)
	WHERE pensja.kwota < 1500; --tu zmieni�am na 1500 bo nie mam

SELECT * FROM ksiegowosc.pracownicy
ORDER BY pracownicy.id_pracownika;
