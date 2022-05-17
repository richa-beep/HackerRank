SELECT city.name
FROM Country
    INNER JOIN City ON Country.Code = City.CountryCode
WHERE Country.Continent = 'Africa';