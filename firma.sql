--Baza danych firma
CREATE DATABASE firma;
--tworzenie schematu 
CREATE SCHEMA rozliczenia;

--tworzenie tabeli pracownicy
CREATE TABLE rozliczenia.pracownicy (
	id_pracownika int PRIMARY KEY NOT NULL,
	imiê varchar(30),
	nazwisko varchar(30) NOT NULL,
	adres varchar(30),
	telefon char(9) NOT NULL
);


--tworzenie tabeli godziny
CREATE TABLE rozliczenia.godziny (
	id_godziny int PRIMARY KEY NOT NULL,
	data date NOT NULL, 
	liczba_godzin int NOT NULL,
	id_pracownika int NOT NULL,
);

--tworzenie tabeli premie
CREATE TABLE rozliczenia.premie(
	id_premii int PRIMARY KEY NOT NULL,
	rodzaj varchar(30),
	kwota money NOT NULL
);

--tworzenie tabeli pensje
CREATE TABLE rozliczenia.pensje(
	id_pensji int PRIMARY KEY NOT NULL,
	stanowisko varchar(30),
	kwota money NOT NULL,
	id_premii int NOT NULL
);

--usuwanie tabel 
drop table rozliczenia.pracownicy;
drop table rozliczenia.godziny
drop table rozliczenia.premie
drop table rozliczenia.pensje

--dodawanie kluczy obcych
ALTER TABLE rozliczenia.godziny 
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie (id_premii);



--wprowadzanie rekordów
--do pracownikow
INSERT INTO rozliczenia.pracownicy VALUES(0, 'Agnieszka', 'Zozol', 'Ul.J. Popie³uszki 1', '544762987');
INSERT INTO rozliczenia.pracownicy VALUES(1, 'Grzegorz','Bard','Al.A.Mickiewicza 44','799812532');
INSERT INTO rozliczenia.pracownicy VALUES(2, 'El¿bieta','Wyrwiz¹b','Ul.Bazarkowa 65','666999766');
INSERT INTO rozliczenia.pracownicy VALUES(3, 'Karol','Paper','Al.Jana Paw³a II 2a','700090807');
INSERT INTO rozliczenia.pracownicy VALUES(4, 'Tomasz','Nicpoñ','Ul.Ogórkowa 21/3','791235672');
INSERT INTO rozliczenia.pracownicy VALUES(5, 'Zofia','Lipa','Ul.Szczêœliwa 13','566812952');
INSERT INTO rozliczenia.pracownicy VALUES(6, 'Paulina','Skrzypek','Ul.Bawe³niana 34','543769245');
INSERT INTO rozliczenia.pracownicy VALUES(7, 'Ryszard','Fedor','Ul.Janko Muzykanta 1','500707890');
INSERT INTO rozliczenia.pracownicy VALUES(8, 'Iwona','Nowak','Ul.Poziomkowa 4','786544200');
INSERT INTO rozliczenia.pracownicy VALUES(9, 'Micha³','Molenda','Ul.Sezamkowa 67/122','548766900');
SELECT * FROM rozliczenia.pracownicy


--do godzin
INSERT INTO rozliczenia.godziny VALUES(0,'2022-03-10', 160,0);
INSERT INTO rozliczenia.godziny VALUES(1,'2022-03-10', 86,1);
INSERT INTO rozliczenia.godziny VALUES(2,'2022-03-10', 176,2);
INSERT INTO rozliczenia.godziny VALUES(3,'2022-03-10', 122,3);
INSERT INTO rozliczenia.godziny VALUES(4,'2022-03-10', 126,4);
INSERT INTO rozliczenia.godziny VALUES(5,'2022-03-10', 80,5);
INSERT INTO rozliczenia.godziny VALUES(6,'2022-03-10', 178,6);
INSERT INTO rozliczenia.godziny VALUES(7,'2022-03-10', 108,7);
INSERT INTO rozliczenia.godziny VALUES(8,'2022-03-10', 160,8);
INSERT INTO rozliczenia.godziny VALUES(9,'2022-03-10', 169,9);
SELECT * FROM rozliczenia.godziny;

--do premii
INSERT INTO rozliczenia.premie VALUES(0,'Najmniej wypitych kaw',100);
INSERT INTO rozliczenia.premie VALUES(1,'Najefektywniejszy pracownik',300);
INSERT INTO rozliczenia.premie VALUES(2,'Najwiêcej nadgodzin',150);
INSERT INTO rozliczenia.premie VALUES(3,'Najmilszy pracownik',250);
INSERT INTO rozliczenia.premie VALUES(4,'Pracownik bez spóŸnienia',10);
INSERT INTO rozliczenia.premie VALUES(5,'Pracownik zachowuj¹cy deadliny',50);
INSERT INTO rozliczenia.premie VALUES(6,'Bez samochodu',100);
INSERT INTO rozliczenia.premie VALUES(7,'Sfinalizowanie projektu',350);
INSERT INTO rozliczenia.premie VALUES(8,'Opieka nad sta¿ystami',200);
INSERT INTO rozliczenia.premie VALUES(9, 'Brak premii', 0);
SELECT * FROM rozliczenia.premie;

--do pensji
INSERT INTO rozliczenia.pensje VALUES(0, 'Analityk', 4500, 0);
INSERT INTO rozliczenia.pensje VALUES(1, 'Sta¿ysta', 1500, 1);
INSERT INTO rozliczenia.pensje VALUES(2, 'Sekretarka', 3000, 0);
INSERT INTO rozliczenia.pensje VALUES(3, 'Programista', 5000, 4);
INSERT INTO rozliczenia.pensje VALUES(4, 'Programista', 5000, 3);
INSERT INTO rozliczenia.pensje VALUES(5, 'Sprz¹taczka', 2500, 6);
INSERT INTO rozliczenia.pensje VALUES(6, 'Administrator', 6500,6);
INSERT INTO rozliczenia.pensje VALUES(7, 'Analityk', 5700, 8);
INSERT INTO rozliczenia.pensje VALUES(8, 'Programista', 5800, 9);
INSERT INTO rozliczenia.pensje VALUES(9, 'Sta¿ysta', 3000, 4);
SELECT * FROM rozliczenia.pensje;

--Zadanie 5 -> wyœwietlanie nazwisk i adresó pracowników
SELECT nazwisko, adres FROM rozliczenia.pracownicy;


--Zadanie 6 -> przekonwertowanie daty w tabeli godziny, aby wyœwietlana by³a informacja jaki to dzieñ tygodnia i jaki miesi¹c (funkcja DATEPART x2)
SELECT DATEPART (dw, data) AS Dzieñ_tygodnia FROM rozliczenia.godziny; --dzieñ tygodnia
--wyœwietla czwartek jako dzieñ 5, liczy dni tygodnia od niedzieli
SELECT DATEPART (mm, data) AS Miesi¹c FROM rozliczenia.godziny; --miesi¹c

--add:tu pokazuje nazwy
SELECT DATENAME (dw, data) AS Dzieñ_tygodnia FROM rozliczenia.godziny; 
SELECT DATENAME (mm, data) AS Miesi¹c FROM rozliczenia.godziny;

--Zadanie 7 
--zmiana nazwy atrybutu kwota na kwota_brutto
EXEC sp_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN';
SELECT * FROM rozliczenia.pensje;

--dodanie atrybutu o nazwie kwota_netto
ALTER TABLE rozliczenia.pensje
ADD kwota_netto money;

--obliczanie netto
UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto*0.81; --VAT 19%

