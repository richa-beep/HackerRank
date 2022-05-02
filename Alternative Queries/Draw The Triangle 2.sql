SET @NUMBER = 0;
SELECT REPEAT('* ', @NUMBER := @NUMBER + 1)
FROM information_schema.tables
WHERE @NUMBER < 20;