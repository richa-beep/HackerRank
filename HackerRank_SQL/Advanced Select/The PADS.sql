SELECT CONCAT(NAME, '(', SUBSTR(OCCUPATION, 1, 1), ')')
FROM OCCUPATIONS
ORDER BY NAME;
SELECT CONCAT(
        'There are a total of',
        ' ',
        COUNT(OCCUPATION),
        ' ',
        lower(OCCUPATION),
        's.'
    ) as Profess
FROM OCCUPATIONS
Group by Occupation
Order by Profess;