SELECT h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS challenge_counter
FROM HACKERS AS H
    JOIN CHALLENGES AS C ON h.hacker_id = c.hacker_id
Group by h.hacker_id,
    h.name
HAVING challenge_counter IN (
        SELECT aux_table.counter
        from (
                SELECT hacker_id,
                    COUNT(challenge_id) AS counter
                FROM challenges
                GROUP BY hacker_id
            ) AS aux_table
        GROUP BY aux_table.counter
        HAVING COUNT(aux_table.counter) = 1
    )
    OR challenge_counter =(
        SELECT MAX(aux_table.counter)
        FROM(
                SELECT hacker_id,
                    COUNT(challenge_id) AS counter
                FROM challenges
                GROUP BY hacker_id
            ) AS aux_table
    )
ORDER BY challenge_counter DESC,
    h.hacker_id ASC;