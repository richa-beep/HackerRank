SELECT Start_Date,
    MIN(End_Date)
FROM (
        SELECT START_DATE
        FROM PROJECTS
        WHERE START_DATE NOT IN(
                SELECT END_DATE
                FROM PROJECTS
            )
    ) A,
    (
        SELECT END_DATE
        FROM PROJECTS
        WHERE END_DATE NOT IN(
                SELECT START_DATE
                FROM PROJECTS
            )
    ) B
WHERE START_DATE < END_DATE
GROUP BY START_DATE
ORDER BY DATEDIFF(START_DATE, MIN(END_DATE)) DESC,
    START_DATE;