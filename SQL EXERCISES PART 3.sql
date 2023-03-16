--
-- SQL EXERCISES - PART 3


-- SIMPLE AND COMPLEX QUERIES

-----------------------------------------------------------




--27. How many countries are in each od the 7 continents?

SELECT Continent, COUNT(Code) AS IlePanstw 
FROM country GROUP BY Continent ORDER BY IlePanstw DESC 




--28. Which official languages ​​are spoken by the most European countries?

SELECT Language, COUNT(CountryCode) AS IlePanstwUzywa 
FROM countrylanguage, country
WHERE IsOfficial = "T" AND Continent = "Europe"
AND country.code = country.language
GROUP BY Language ORDER BY IlePanstwUzywa DESC




--29. For each country in South America, 
--give the total number of citizens living in large cities 
--with a population of at least 100,000

SELECT country.name, SUM(city.Population) AS IluObywateli
FROM city, country
WHERE Continent="South America"
AND city.population>=100000
AND country.Code=city.countryCode 
GROUP BY country.Name
ORDER BY IluObywateli DESC




--30. How many birds of the same species were observed? 
-- Which species were the most numerous?

SELECT nazwa_zwyczajowa, SUM(liczebnosc) AS IlePtakow
FROM gatunki, obserwacje
WHERE gatunki.ID_gatunku=obserwacje.ID_gatunku
GROUP BY nazwa_zwyczajowa
ORDER BY IlePtakow DESC




--31. Which 10 bird species were observed most often in the Gdansk region?

SELECT nazwa_zwyczajowa, COUNT(obserwacje.ID_gatunku) AS IleObserwacji
FROM gatunki, obserwacje, lokalizacje
WHERE gatunki.ID_gatunku=obserwacje.ID_gatunku
AND obserwacje.id_lokalizacji=lokalizacje.id_lokalizacji
AND lokalizacje.powiat="gdanski" 
GROUP BY gatunki.nazwa_zwyczajowa
ORDER BY IleObserwacji DESC
LIMIT 10