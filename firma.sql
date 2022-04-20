--Baza danych firma
CREATE DATABASE firma;
--tworzenie schematu 
CREATE SCHEMA rozliczenia;

--tworzenie tabeli pracownicy
CREATE TABLE rozliczenia.pracownicy (
	id_pracownika char(3) PRIMARY KEY NOT NULL,
	imiê nvarchar(30),
	nazwisko nvarchar(30) NOT NULL,
	adres varchar(30),
	telefon char(9)
);


--tworzenie tabeli godziny
CREATE TABLE rozliczenia.godziny (
	id_godziny char(2) PRIMARY KEY NOT NULL,
	data date NOT NULL, 
	liczba_godzin int NOT NULL,
	id_pracownika char(3) NOT NULL,
);

--tworzenie tabeli premie
CREATE TABLE rozliczenia.premie(
	id_premii char(3) PRIMARY KEY NOT NULL,
	rodzaj varchar(30),
	kwota money NOT NULL
);

--tworzenie tabeli pensje
CREATE TABLE rozliczenia.pensje(
	id_pensji char(3) PRIMARY KEY NOT NULL,
	stanowisko varchar(30),
	kwota money NOT NULL,
	id_premii char(3) NOT NULL,
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
INSERT INTO rozliczenia.pracownicy VALUES('A01', 'Agnieszka', 'Zozol', 'Ul.J. Popie³uszki 1', '544762987');
INSERT INTO rozliczenia.pracownicy VALUES('A02', 'Grzegorz','Bard','Al.A.Mickiewicza 44','799812532');
INSERT INTO rozliczenia.pracownicy VALUES('A03', 'El¿bieta','Wyrwiz¹b','Ul.Bazarkowa 65','666999766');
INSERT INTO rozliczenia.pracownicy VALUES('A04', 'Karol','Papie¿','Al.Jana Paw³a II 2a','700090807');
INSERT INTO rozliczenia.pracownicy VALUES('A05', 'Tomasz','Nicpoñ','Ul.Ogórkowa 21/3','791235672');
INSERT INTO rozliczenia.pracownicy VALUES('A06', 'Zofia','Lipa','Ul.Szczêœliwa 13','566812952');
INSERT INTO rozliczenia.pracownicy VALUES('A07', 'Paulina','Skrzypek','Ul.Bawe³niana 34','543769245');
INSERT INTO rozliczenia.pracownicy VALUES('A08', 'Ryszard','Fedor','Ul.Janko Muzykanta 1','500707890');
INSERT INTO rozliczenia.pracownicy VALUES('A09', 'Iwona','Nowak','Ul.Poziomkowa 4','786544200');
INSERT INTO rozliczenia.pracownicy VALUES('A10', 'Micha³','Molenda','Ul.Sezamkowa 67/122','548766900');
SELECT * FROM rozliczenia.pracownicy


--do godzin
INSERT INTO rozliczenia.godziny VALUES('01','2022-03-10', 160,'A01');
INSERT INTO rozliczenia.godziny VALUES('02','2022-03-10', 86,'A02');
INSERT INTO rozliczenia.godziny VALUES('03','2022-03-10', 176,'A03');
INSERT INTO rozliczenia.godziny VALUES('04','2022-03-10', 122,'A04');
INSERT INTO rozliczenia.godziny VALUES('05','2022-03-10', 126,'A05');
INSERT INTO rozliczenia.godziny VALUES('06','2022-03-10', 80,'A06');
INSERT INTO rozliczenia.godziny VALUES('07','2022-03-10', 178,'A07');
INSERT INTO rozliczenia.godziny VALUES('08','2022-03-10', 108,'A08');
INSERT INTO rozliczenia.godziny VALUES('09','2022-03-10', 160,'A09');
INSERT INTO rozliczenia.godziny VALUES('10','2022-03-10', 169,'A10');
SELECT * FROM rozliczenia.godziny;

--do premii
INSERT INTO rozliczenia.premie VALUES('NKW','Najmniej wypitych kaw',100);
INSERT INTO rozliczenia.premie VALUES('IPM','Najefektywniejszy pracownik',300);
INSERT INTO rozliczenia.premie VALUES('NAD','Najwiêcej nadgodzin',150);
INSERT INTO rozliczenia.premie VALUES('MIL','Najmilszy pracownik',250);
INSERT INTO rozliczenia.premie VALUES('NSP','Pracownik bez spóŸnienia',10);
INSERT INTO rozliczenia.premie VALUES('DED','Pracownik zachowuj¹cy deadliny',50);
INSERT INTO rozliczenia.premie VALUES('ECO','Bez samochodu',100);
INSERT INTO rozliczenia.premie VALUES('SFP','Sfinalizowanie projektu',350);
INSERT INTO rozliczenia.premie VALUES('OPS','Opieka nad sta¿ystami',200);
INSERT INTO rozliczenia.premie VALUES('ZER', 'Brak premii', 0);
SELECT * FROM rozliczenia.premie;

--do pensji
INSERT INTO rozliczenia.pensje VALUES('01Z', 'Analityk', 4500,'ZER');
INSERT INTO rozliczenia.pensje VALUES('02B', 'Sta¿ysta', 1500,'NSP');
INSERT INTO rozliczenia.pensje VALUES('03W', 'Sekretarka', 3000,'NKW');
INSERT INTO rozliczenia.pensje VALUES('04P', 'Programista', 5000,'DED');
INSERT INTO rozliczenia.pensje VALUES('05N', 'Programista', 5000,'ECO');
INSERT INTO rozliczenia.pensje VALUES('06L', 'Sprz¹taczka', 2500 ,'NKW');
INSERT INTO rozliczenia.pensje VALUES('07S', 'Administrator', 6500,'ECO');
INSERT INTO rozliczenia.pensje VALUES('08F', 'Analityk', 5700,'ECO');
INSERT INTO rozliczenia.pensje VALUES('09N', 'Programista', 5800,'OPS');
INSERT INTO rozliczenia.pensje VALUES('00M', 'Sta¿ysta', 3000 ,'ZER');
SELECT * FROM rozliczenia.pensje;

--Zadanie 5 -> wyœwietlanie nazwisk i adresó pracowników
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--Zadanie 6 -> przekonwertowanie daty w tabeli godziny, aby wyœwietlana by³a informacja jaki to dzieñ tygodnia i jaki miesi¹c (funkcja DATEPART x2)
SELECT DATEPART (dw, data) AS Dzieñ_tygodnia FROM rozliczenia.godziny; --dzieñ tygodnia
--wyœwietla czwartek jako dzieñ 5, liczy dni tygodnia po bo¿emu od niedzieli
SELECT DATEPART (mm, data) AS Miesi¹c FROM rozliczenia.godziny; --miesi¹c

--add:tu pokazuje nazwy
SELECT DATENAME (dw, data) AS Dzieñ_tygodnia FROM rozliczenia.godziny; 
SELECT DATENAME (mm, data) AS Miesi¹c FROM rozliczenia.godziny ;

--Zadanie 7 
--zmiana nazwy atrybutu kwota na kwota_brutto
EXEC sp_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN';
SELECT * FROM rozliczenia.pensje;

--dodanie atrybutu o nazwie kwota_netto
ALTER TABLE rozliczenia.pensje
ADD kwota_netto money;

--obliczanie netto
UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto*0.81; --VAT 19%

