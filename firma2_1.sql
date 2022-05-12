-- Database: firma2.1

-- DROP DATABASE IF EXISTS "firma2.1";

CREATE DATABASE "firma2.1"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- Database: firma2.1

-- DROP DATABASE IF EXISTS "firma2.1";

CREATE DATABASE "firma2.1"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
--tworzenie tabeli pracownicy
CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika int PRIMARY KEY NOT NULL,
	imię varchar(30),
	nazwisko varchar(30) NOT NULL,
	adres varchar(30),
	telefon varchar(20) NOT NULL
);

--tworzenie tabeli godziny
CREATE TABLE ksiegowosc.godziny (
	id_godziny int PRIMARY KEY NOT NULL,
	data date NOT NULL, 
	liczba_godzin int NOT NULL,
	id_pracownika int NOT NULL,
	liczba_nadgodzin int
);

--tworzenie tabeli pensja
CREATE TABLE ksiegowosc.pensja(
	id_pensji int PRIMARY KEY NOT NULL,
	stanowisko varchar(30),
	kwota money NOT NULL
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


--usuwanie tabel 
drop table ksiegowosc.pracownicy;
drop table ksiegowosc.godziny;
drop table ksiegowosc.premie;
drop table ksiegowosc.pensje;
drop table księgowosc.wynagrodzenia;

ALTER TABLE ksiegowosc.godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
ALTER TABLE ksiegowosc.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_godziny_fkey;
ALTER TABLE ksiegowosc.pracownicy DROP CONSTRAINT pracownicy_pkey;
ALTER TABLE ksiegowosc.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_pracownika_fkey;





--wprowadzanie rekordów
--do pracownikow
INSERT INTO ksiegowosc.pracownicy VALUES(0, 'Agnieszka', 'Zozol', 'Ul.J. Popiełuszki 1', '544762987');
INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Grzegorz','Bard','Al.A.Mickiewicza 44','799812532');
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'Elżbieta','Wyrwiząb','Ul.Bazarkowa 65','666999766');
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Jan','Paper','Al.Jana Pawła II 2a','700090807');
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Tomasz','Nicpoń','Ul.Ogórkowa 21/3','791235672');
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Zofia','Lipa','Ul.Szczęśliwa 13','566812952');
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Paulina','Skrzypek','Ul.Bawełniana 34','543769245');
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Ryszard','Fedor','Ul.Janko Muzykanta 1','500707890');
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Iwona','Nowak','Ul.Poziomkowa 4','786544200');
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Michał','Molenda','Ul.Sezamkowa 67/122','548766900');



--do godzin
INSERT INTO ksiegowosc.godziny VALUES(0,'2022-03-10', 160,0,0);
INSERT INTO ksiegowosc.godziny VALUES(1,'2022-03-10', 86,1,0);
INSERT INTO ksiegowosc.godziny VALUES(2,'2022-03-10', 176,2,16);
INSERT INTO ksiegowosc.godziny VALUES(3,'2022-03-10', 122,3,0);
INSERT INTO ksiegowosc.godziny VALUES(4,'2022-03-10', 126,4,0);
INSERT INTO ksiegowosc.godziny VALUES(5,'2022-03-10', 80,5,0);
INSERT INTO ksiegowosc.godziny VALUES(6,'2022-03-10', 178,6, 18);
INSERT INTO ksiegowosc.godziny VALUES(7,'2022-03-10', 108,7,0);
INSERT INTO ksiegowosc.godziny VALUES(8,'2022-03-10', 160,8,0);
INSERT INTO ksiegowosc.godziny VALUES(9,'2022-03-10', 169,9,9);
SELECT * FROM ksiegowosc.godziny;

--do premii
INSERT INTO ksiegowosc.premia VALUES(0,'Najmniej wypitych kaw',100);
INSERT INTO ksiegowosc.premia VALUES(1,'Najefektywniejszy pracownik',300);
INSERT INTO ksiegowosc.premia VALUES(2,'Najwięcej nadgodzin',150);
INSERT INTO ksiegowosc.premia VALUES(3,'Najmilszy pracownik',250);
INSERT INTO ksiegowosc.premia VALUES(4,'Pracownik bez spóźnienia',10);
INSERT INTO ksiegowosc.premia VALUES(5,'Pracownik zachowujący deadliny',50);
INSERT INTO ksiegowosc.premia VALUES(6,'Bez samochodu',100);
INSERT INTO ksiegowosc.premia VALUES(7,'Sfinalizowanie projektu',350);
INSERT INTO ksiegowosc.premia VALUES(8,'Opieka nad stażystami',200);
INSERT INTO ksiegowosc.premia VALUES(9, 'Brak premii', 0);
SELECT * FROM ksiegowosc.premia;

--do pensji
INSERT INTO ksiegowosc.pensja VALUES(0, 'Analityk', 4500);
INSERT INTO ksiegowosc.pensja VALUES(1, 'Stażysta', 1200);
INSERT INTO ksiegowosc.pensja VALUES(2, 'Sekretarka', 3000);
INSERT INTO ksiegowosc.pensja VALUES(3, 'Programista', 5000);
INSERT INTO ksiegowosc.pensja VALUES(4, 'Programista', 5000);
INSERT INTO ksiegowosc.pensja VALUES(5, 'Sprzątaczka', 2500);
INSERT INTO ksiegowosc.pensja VALUES(6, 'Administrator', 6500);
INSERT INTO ksiegowosc.pensja VALUES(7, 'Analityk', 5700);
INSERT INTO ksiegowosc.pensja VALUES(8, 'Programista', 5800);
INSERT INTO ksiegowosc.pensja VALUES(9, 'Stażysta', 3000);
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


--ćwiczenie 6b
--a
--Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)
UPDATE ksiegowosc.pracownicy SET  telefon = '(+48)'|| telefon; 
SELECT * FROM ksiegowosc.pracownicy

--b
--Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333’ 
UPDATE ksiegowosc.pracownicy SET  telefon = substr(telefon, 1,3) || '-' || substr(telefon, 4,3) || '-' || substr(telefon, 7,3)
UPDATE ksiegowosc.pracownicy SET  telefon = substr(telefon, 1,8) || '-' || substr(telefon, 9,3) || '-' || substr(telefon, 12,3)
SELECT * FROM ksiegowosc.pracownicy

--c
--Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter
SELECT UPPER(imię), UPPER(nazwisko),UPPER(adres), telefon FROM ksiegowosc.pracownicy  ORDER BY length(nazwisko) DESC LIMIT 1

--d
-- Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5 
SELECT MD5(pracownicy.id_pracownika::char) as id_pracownika , 
	   MD5(imię) as imię, MD5(nazwisko) as nazwisko, 
	   MD5(adres) as adres, 
	   MD5(telefon) as telefon, 
	   MD5(pensja.kwota::char) as pensja
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika 
INNER JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji


--e
--Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
SELECT pracownicy.id_pracownika, 
	   imię,
	   nazwisko, 
	   adres, 
	   telefon, 
	   pensja.kwota,
	   premia.kwota
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika 
LEFT JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji
LEFT JOIN ksiegowosc.premia
ON wynagrodzenie.id_premii = premia.id_premii

--f
--wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie 
--wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 z
SELECT 
	'Pracownik ' ||pracownicy.imię ||' ' || pracownicy.nazwisko ||', w dniu ' ||
		godziny.data ||' otrzymał pensję całkowitą na kwotę ' ||
		(pensja.kwota+premia.kwota+godziny.liczba_nadgodzin::money*30)||
		', gdzie wynagrodzenie zasadnicze wynosiło: '||
		pensja.kwota || ', premia:'||
		premia.kwota || ', nadgodziny: ' || godziny.liczba_nadgodzin*30 || 'zł.' AS Raport
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
LEFT JOIN ksiegowosc.godziny ON godziny.id_godziny = wynagrodzenie.id_godziny
LEFT JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
LEFT JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_premii