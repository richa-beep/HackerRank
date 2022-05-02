SELECT X,
    Y
FROM(
        SELECT X,
            Y
        FROM FUNCTIONS
        WHERE X = Y
        GROUP BY X,
            Y
        HAVING COUNT(*) = 2
        UNION
        SELECT F1.X,
            F1.Y
        FROM FUNCTIONS F1,
            FUNCTIONS F2
        WHERE F1.X < F1.Y
            AND F1.X = F2.Y
            AND F2.X = F1.Y
    ) T
ORDER BY X,
    Y;