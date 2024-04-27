-- SQL script that creates a stored procedure ComputeAverageScoreForUser 
-- that computes and store the average score
-- for a student. Note: An average score can be a decimal

CREATE PROCEDURE ComputeAverageScoreForUser(
    user_id INT
)
BEGIN
    DECLARE average_score FLOAT;
    SELECT AVG(score) INTO average_score FROM corrections WHERE user_id = user_id;
    INSERT INTO average_score (user_id, score) VALUES (user_id, average_score);
END;
