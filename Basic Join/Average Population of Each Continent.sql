SELECT COUNTRY.Continent,
    FLOOR(avg(City.population))
FROM Country
    INNER JOIN City ON Country.Code = City.CountryCode
GROUP BY COUNTRY.Continent;