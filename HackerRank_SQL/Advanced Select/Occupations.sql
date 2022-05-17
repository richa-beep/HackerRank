SELECT [Doctor],
    [Professor],
    [Singer],
    [Actor]
FROM (
        SELECT ROW_NUMBER() OVER (
                PARTITION BY Occupation
                ORDER BY Name
            ) ROW_NO,
            ISNULL(NULL, Name) as Name,
            Occupation
        FROM Occupations
    ) AS t PIVOT(
        MAX(Name) FOR Occupation IN (
            [Doctor],
            [Professor],
            [Singer],
            [Actor]
        )
    ) AS pivot_table
ORDER BY ROW_NO;