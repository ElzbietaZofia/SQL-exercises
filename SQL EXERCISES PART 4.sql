--
-- SQL EXERCISES - PART 4

-- 1. CREATING DATABASE AND TABLES
-- 2. SIMPLE AND COMPLEX QUERIES

-----------------------------------------------------------



--
-- Creating database: `wypozyczalnia_samochodow`


DROP DATABASE IF EXISTS wypozyczalnia_samochodow;

CREATE DATABASE wypozyczalnia_samochodow;

USE  wypozyczalnia_samochodow;
				
CREATE TABLE klienci (id_klienta INT auto_increment PRIMARY KEY,
					  imie_klienta VARCHAR (45),
					  nazwisko_klienta VARCHAR (45),
					  ulica_klienta VARCHAR (45),
					  numer_domu_klienta VARCHAR(8),
					  miasto_klienta VARCHAR (45),
					  kod_klienta VARCHAR (6),
					  telefon_klienta VARCHAR (14),
					  email_klienta VARCHAR (50)
					  );
						
create table pracownicy (id_pracownika INT auto_increment PRIMARY KEY,
						 imie_pracownika VARCHAR (45),
						 nazwisko_pracownika VARCHAR (45),
						 miasto_pracownika VARCHAR (45),
						 telefon_pracownika VARCHAR (14),
						 email_pracownika VARCHAR (50),
						 szef_id INT
						 );
							
create table samochody (id_samochodu INT auto_increment PRIMARY KEY,
						marka VARCHAR (20),
						model VARCHAR (20),
						data_prod YEAR,
						dostepnosc INT
						);
						
create table wypozyczenia (id_wypozyczenia INT auto_increment PRIMARY KEY,
						   data_wyp DATE,
						   data_zwr DATE,
						   id_klienta INT,
						   id_pracownika INT,
						   CONSTRAINT k_1 FOREIGN key (id_klienta) REFERENCES klienci(id_klienta) ON DELETE SET NULL ON UPDATE CASCADE,
						   CONSTRAINT p_1 FOREIGN key (id_pracownika) REFERENCES pracownicy(id_pracownika) ON DELETE SET NULL ON UPDATE CASCADE							
						   );

CREATE TABLE dane_wypozyczen (id_wypozyczenia INT,
							  id_samochodu INT,
						      cena_doba FLOAT,
						      ilosc_dob INT,
							  CONSTRAINT w_1 FOREIGN KEY (id_wypozyczenia) REFERENCES wypozyczenia (id_wypozyczenia) ON DELETE SET NULL ON UPDATE CASCADE,
							  CONSTRAINT s_1 FOREIGN KEY (id_samochodu) REFERENCES samochody (id_samochodu) ON DELETE no action ON UPDATE CASCADE
							  );
						
					
INSERT INTO klienci (imie_klienta,nazwisko_klienta,ulica_klienta,numer_domu_klienta,miasto_klienta,kod_klienta,telefon_klienta,email_klienta) 
VALUES ('Damian','Stelmach','Mokra','6','Grajewo','19-200','985-746-350','stelmaszczyk@wp.pl'),
	   ('Adam','Wrzosek','Sucha','16','Bielsko-Biała','43-400','756-358-068','wrzosek_adam@gmail.com'),
	   ('Mateusz','Karwowski','Ciepla','12','Gliwice','44-100','674-968-785','mati_25@onet.pl'),
	   ('Anna','Ajewska','Wolna','21/3','Biłgoraj','23-400','455-734-224','konstytycja_jest_ok@gmail.com'),
	   ('Dawid','Stary','Kopernika','10/23','Brzegabrze','49-300','485-236-150','mlody_stary@wp.pl'),
	   ('Monika','Młoda','Mickiewicza','22/12','Zabrze','41-700','985-749-607','monia21@gmail.com'),
	   ('Weronika','Eczarska','Chorzowska','6/1','Chorzów','40-100','185-716-150','ecza_pecza@onet.pl'),
	   ('Marek','Marecki','Piotrowska','26','Łódź','90-000','856-368-028','marunio@wp.pl'),
	   ('Tomasz','Karwowski','Zimna','112','Białystok','15-000','485-769-617','karwowski_tomek@gmail.com'),
	   ('Grażyna','Witkowska','Andersa','67b/2','Kielce','25-000','345-726-354','witkowa17@onet.pl'),
	   ('Zbigniew','Swawolny','Opolska','166','Wrocław','55-030','726-358-088','zbusiu@wp.pl'),
	   ('Stefan','Maciejewski','Wrocławska','1/16','Katowice','40-010','785-729-647','stefanek_m@wp.pl'),
	   ('Wioletta','Frywolna','Zabrzańska','3','Świętochłowice','41-500','685-700-323','wiolka_f@onet.pl'),
	   ('Franciszek','Malczewska','Błotnista','1a/5','Kraków','33-030','746-318-168','malcze_fr@gmail.com'),
	   ('Wiktoria','Mrozek','Witosa','124','Zakopane','34-500','985-249-628','mro_wik@gmail.com');
																					
INSERT INTO pracownicy (imie_pracownika,nazwisko_pracownika,miasto_pracownika,telefon_pracownika,email_pracownika,szef_id) 
VALUES ('Wojciech','Anders','Wrocław','185-256-340','andersik@wp.pl',NULL),
	   ('Modest','Nowacki','Brzeg','868-456-351','nowacki_m@onet.pl',1),
	   ('Andrzej','Mróz','Kąty Wrocławskie','185-286-850','mrozno_andrej@wp.pl',2),
	   ('Franciszka','Gwolik','Wrocław','285-897-250','gwoliczka_f@gmail.com',2),
	   ('Aneta','Pawlak','Wrocław','485-757-223','anetka_pawlak@wp.pl',2);
																					
 
INSERT INTO samochody (marka,model,data_prod,dostepnosc)
VALUES ('opel','astra',2000,2),
	   ('mercedes','CLK',2011,3),
	   ('audi','A4',2012,1),
	   ('bmw','3',2015,3),
	   ('renault','clio',2022,3),
	   ('opel','corsa',2022,1),
	   ('mercedes','S',2021,4),
	   ('audi','A8',2019,5),
	   ('bmw','X6',2018,3),
	   ('renault','megane',2017,2),
	   ('ford','mondeo',2005,1);

INSERT INTO wypozyczenia (data_wyp,data_zwr,id_klienta,id_pracownika)
VALUES ('2022-04-10','2022-04-12',1,3),
	   ('2022-04-10','2022-04-13',2,2),
	   ('2022-04-10','2022-04-11',6,4),
	   ('2022-04-11','2022-04-12',NULL,3),
	   ('2022-04-11','2022-04-14',1,2),
	   ('2022-04-11','2022-04-13',7,3),
	   ('2022-04-11','2022-04-12',4,4),
	   ('2022-04-11','2022-04-15',12,2),
	   ('2022-04-15','2022-04-17',NULL,3),
	   ('2022-04-15','2022-04-16',11,1),
	   ('2022-04-15','2022-04-16',3,2),
	   ('2022-04-15','2022-04-18',6,2),
	   ('2022-05-01','2022-05-04',9,3),
	   ('2022-05-01','2022-05-04',1,3),
	   ('2022-05-01','2022-05-05',NULL,3),
	   ('2022-05-22','2022-05-24',1,2),
	   ('2022-05-22','2022-05-23',11,2),
	   ('2022-05-30','2022-06-01',13,4),
	   ('2022-06-03','2022-06-05',9,4),
	   ('2022-06-03','2022-06-05',8,4),
	   ('2022-06-10','2022-06-12',6,3),
	   ('2022-07-01','2022-07-03',3,NULL),
	   ('2022-07-04','2022-07-05',2,1),
	   ('2022-07-06','2022-07-07',13,2),
	   ('2022-07-11','2022-07-12',11,2),
	   ('2022-07-22','2022-07-23',9,3),
	   ('2022-07-30','2022-08-02',6,2),
	   ('2022-08-01','2022-08-06',3,2),
	   ('2022-08-02','2022-08-04',4,3),
	   ('2022-08-07','2022-08-10',9,NULL),
	   ('2022-08-11','2022-08-12',10,3),
	   ('2022-08-11','2022-08-12',1,4),
	   ('2022-08-11','2022-08-13',5,3),
	   ('2022-08-12','2022-08-15',7,4),
	   ('2022-08-15','2022-08-17',6,3),
	   ('2022-08-15','2022-08-18',12,2),
	   ('2022-08-15','2022-08-16',11,3),
	   ('2022-08-15','2022-08-16',9,1),
	   ('2022-08-18','2022-08-19',5,2),
	   ('2022-08-29','2022-09-01',2,2),
	   ('2022-09-01','2022-09-10',7,2),
	   ('2022-09-01','2022-09-05',8,3),
	   ('2022-09-01','2022-09-03',12,4),
	   ('2022-09-05','2022-09-07',9,4),
	   ('2022-09-05','2022-09-07',2,4),
	   ('2022-09-06','2022-09-08',5,4),
	   ('2022-09-07','2022-09-10',7,1),
	   ('2022-09-15','2022-09-17',6,2),
	   ('2022-09-16','2022-09-18',8,3),
	   ('2022-09-19','2022-09-20',9,3),
	   ('2022-09-19','2022-09-20',13,3),
	   ('2022-09-19','2022-09-20',10,2),
	   ('2022-09-19','2022-09-21',9,2),
	   ('2022-09-24','2022-09-25',8,3),
	   ('2022-10-05','2022-10-06',7,2),
	   ('2022-10-05','2022-10-06',2,3),
	   ('2022-10-07','2022-10-08',1,3),
	   ('2022-10-09','2022-10-11',5,4),
	   ('2022-10-14','2022-10-15',8,4),
	   ('2022-10-14','2022-10-15',3,4),
	   ('2022-10-20','2022-10-22',7,3),
	   ('2022-10-24','2022-10-27',4,4),
	   ('2022-11-05','2022-11-07',11,3),
	   ('2022-11-11','2022-11-12',5,1),
	   ('2022-11-12','2022-11-13',1,3),
	   ('2022-11-15','2022-11-18',4,1);

INSERT INTO dane_wypozyczen (id_wypozyczenia,id_samochodu,cena_doba,ilosc_dob)
VALUES (1,2,550.00,2),
	   (2,6,250.00,3),
	   (3,11,300.00,1),
	   (3,10,250.00,1),
	   (4,7,800.00,1),
	   (5,4,450.00,3),
	   (6,3,450.00,2),
	   (7,3,450.00,1),
	   (8,5,250.00,4),
	   (9,6,250.00,2),
	   (10,2,550.00,1),
	   (11,2,550.00,1),
	   (12,1,200.00,3),
	   (12,6,250.00,3),
	   (13,3,450.00,3),
	   (14,5,250.00,3),
	   (15,7,800.00,4),
	   (16,2,550.00,2),
	   (16,8,800.00,2),
	   (17,1,200.00,1),
	   (18,4,450.00,2),
	   (19,6,250.00,2),
	   (20,7,800.00,2),
	   (21,4,450.00,2),
	   (22,10,250.00,2),
	   (23,2,550.00,1),
	   (24,4,450.00,1),
	   (25,6,250.00,1),
	   (26,7,800.00,1),
	   (27,6,250.00,3),
	   (28,3,450.00,5),
	   (29,11,300.00,2),
	   (30,6,250.00,3),
	   (31,11,300.00,1),
	   (32,4,450.00,1),
	   (33,1,200.00,2),
	   (34,2,550.00,3),
	   (35,3,450.00,2),
	   (36,6,250.00,3),
	   (37,3,450.00,1),
	   (37,7,800.00,1),
	   (38,10,250.00,1),
	   (39,2,550.00,1),
	   (40,6,250.00,3),
	   (41,7,800.00,9),
	   (42,4,450.00,4),
	   (43,1,200.00,2),
	   (44,10,250.00,2),
	   (45,4,450.00,2),
	   (46,2,550.00,2),
	   (47,1,200.00,3),
	   (47,6,250.00,3),
	   (48,3,450.00,2),
	   (48,10,250.00,2),
	   (49,2,550.00,2),
	   (50,10,250.00,1),
	   (51,3,450.00,1),
	   (52,4,450.00,1),
	   (52,11,300.00,1),
	   (53,1,200.00,2),
	   (54,2,550.00,1),
	   (55,7,800.00,1),
	   (56,4,450.00,1),
	   (57,6,250.00,1),
	   (58,10,250.00,2),
	   (59,11,300.0,1),
	   (60,2,550.00,2),
	   (61,4,450.00,2),
	   (62,1,200.00,3),
	   (63,4,450.00,2),
	   (64,7,800.00,1),
	   (64,5,250.00,1),
	   (65,2,550.00,1),
	   (66,6,250.00,3),
	   (66,11,300.00,3);



--
-- EXCERCISES (QUERIES)
--


--32. Select the rental number, brand and model of the rented vehicle.

SELECT dane_wypozyczen.id_wypozyczenia,
samochody.marka,
samochody.model
FROM dane_wypozyczen
INNER JOIN samochody ON samochody.id_samochodu=dane_wypozyczen.id_samochodu
ORDER BY dane_wypozyczen.id_wypozyczenia;




-- 33. Select the rental number, rental date, brand and model of the rented vehicle.

SELECT dane_wypozyczen.id_wypozyczenia,
samochody.marka,
samochody.model,
wypozyczenia.data_wyp
FROM dane_wypozyczen
INNER JOIN samochody ON samochody.id_samochodu=dane_wypozyczen.id_samochodu
INNER JOIN wypozyczenia ON wypozyczenia.id_wypozyczenia=dane_wypozyczen.id_wypozyczenia
ORDER BY dane_wypozyczen.id_wypozyczenia;




--34. Select the rental number, rental date, brand and model of the rented vehicle and customer name.

SELECT dane_wypozyczen.id_wypozyczenia,
samochody.marka,
samochody.model,
wypozyczenia.data_wyp,
klienci.imie_klienta,
klienci.nazwisko_klienta
FROM dane_wypozyczen
INNER JOIN samochody ON samochody.id_samochodu=dane_wypozyczen.id_samochodu
INNER JOIN wypozyczenia ON wypozyczenia.id_wypozyczenia=dane_wypozyczen.id_wypozyczenia
INNER JOIN klienci ON klienci.id_klienta=wypozyczenia.id_klienta
ORDER BY dane_wypozyczen.id_wypozyczenia;




--35. Select the rental number, rental date, brand and model of the rented vehicle, 
--customer name and car rental employee.

SELECT dane_wypozyczen.id_wypozyczenia,
samochody.marka,
samochody.model,
wypozyczenia.data_wyp,
klienci.imie_klienta,
klienci.nazwisko_klienta,
pracownicy.imie_pracownika,
pracownicy.nazwisko_pracownika
FROM dane_wypozyczen
INNER JOIN samochody ON samochody.id_samochodu=dane_wypozyczen.id_samochodu
INNER JOIN wypozyczenia ON wypozyczenia.id_wypozyczenia=dane_wypozyczen.id_wypozyczenia
INNER JOIN klienci ON klienci.id_klienta=wypozyczenia.id_klienta
INNER JOIN pracownicy ON pracownicy.id_pracownika=wypozyczenia.id_pracownika
ORDER BY dane_wypozyczen.id_wypozyczenia;




--36. Select the rental date and brand and model of the rented vehicle.

SELECT wypozyczenia.data_wyp,
samochody.marka,
samochody.model
FROM wypozyczenia
INNER JOIN dane_wypozyczen ON wypozyczenia.id_wypozyczenia = dane_wypozyczen.id_wypozyczenia
INNER JOIN samochody ON samochody.id_samochodu = dane_wypozyczen.id_samochodu
ORDER BY wypozyczenia.data_wyp