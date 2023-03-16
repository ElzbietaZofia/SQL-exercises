--
-- SQL EXERCISES - PART 2


-- SIMPLE AND COMPLEX QUERIES

-----------------------------------------------------------


--
-- EXCERCISES (QUERIES)
--


--12. Change customer no.4's name to Anakonda

UPDATE klienci SET nazwisko="Anakonda" WHERE idklienta=4




--13. Increase the price of all books in the database by 10%

UPDATE ksiazki SET cena=ROUND(cena*1.1,2) 




--14. Reduce the price of the most expensive book in the database by PLN 10

UPDATE ksiazki SET cena=cena-10 
ORDER BY cena DESC LIMIT 1




--15. Change the name of the client Anna Karenina 
--(client ID=10) to the value: Joanna Dostojewska

UPDATE klienci SET imie="Joanna", nazwisko="Dostojewska" 
WHERE idklienta=10




--16. Change the status of orders no.4 and no.5 to "shipped"

UPDATE zamowienia SET status="wyslano" 
WHERE idzamowienia BETWEEN 4 AND 5




--17. Add a new client to the database: Walter White from Albuquerque

INSERT INTO klienci 
VALUES (NULL, "Walter", "White", "Albuquerque")




--18. Add a new order: Artur Rutkowski (7) bought the book "HTML5. Tworzenie witryn" (3)

INSERT INTO zamowienia (idzamowienia, data, status, idklienta, idksiazki) 
VALUES (NULL, 2023-01-15, "oczekiwanie", 7, 3)




--19. Insert into the database the book titled "Symfonia C++", author's surname "Grębosz", 
--without the name of the author and without the price of the book

INSERT INTO ksiazki (idksiazki, nazwiskoautora, tytul) 
VALUES (NULL, "Grębosz", "Symfonia C++")




--20. Add two new customers to the database with one query

INSERT INTO klienci VALUES (NULL, "Dale", "Cooper", "Philadelphia"),
(NULL, "Audrey", "Horne", "Twin Peaks")




--21. Add a new person to the database using an alternative query with a SET clause

INSERT INTO klienci 
SET idklienta=NULL, imie="James", nazwisko="McGill", miejscowosc="Albuquerque"




--22. Remove the name of customer no.3 in the customers table

UPDATE klienci SET nazwisko="" WHERE idklienta=3




--23. Delete all records in the customers table

TRUNCATE TABLE klienci




--24. Remove order no.2 from the order table

DELETE FROM zamowienia WHERE idzamowienia=2




--25. Remove the last five registered customers from the customers table

DELETE FROM klienci ORDER BY idklienta DESC LIMIT 5




--26. Remove the entire customers table

DROP TABLE IF EXISTS  klienci