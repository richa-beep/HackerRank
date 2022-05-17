SELECT Submissions.hacker_id,
    Hackers.name
FROM Hackers,
    Difficulty,
    Challenges,
    Submissions
WHERE Submissions.hacker_id = Hackers.hacker_id
    AND Challenges.difficulty_level = Difficulty.difficulty_level
    AND Difficulty.score = Submissions.score
    AND Submissions.challenge_id = Challenges.challenge_id
GROUP BY Submissions.hacker_id,
    Hackers.name
HAVING count(*) > 1
ORDER BY count(*) DESC,
    Submissions.hacker_id;