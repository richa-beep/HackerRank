SELECT T2.HID,
    H.NAME,
    T2.SCORE
FROM (
        SELECT T1.HACKER_ID AS HID,
            SUM(T1.MAXSCORE) AS SCORE
        FROM (
                SELECT challenge_id,
                    HACKER_ID,
                    MAX(SCORE) AS MAXSCORE
                FROM SUBMISSIONS
                GROUP BY challenge_id,
                    HACKER_ID
            ) T1
        GROUP BY HID
    ) T2
    JOIN HACKERS AS H ON H.HACKER_ID = T2.HID
HAVING T2.SCORE > 0
ORDER BY T2.SCORE DESC,
    T2.HID;