-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser 
-- that computes and store the average weighted score for a student.

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    user_id INT
)
BEGIN
    DECLARE average_score FLOAT;
    DECLARE average_weighted_score FLOAT;
    DECLARE total_score FLOAT;
    DECLARE total_weight FLOAT;
    SELECT AVG(score) INTO average_score FROM corrections WHERE user_id = user_id;
    SELECT SUM(score) INTO total_score FROM corrections WHERE user_id = user_id;
    SELECT SUM(weight) INTO total_weight FROM corrections WHERE user_id = user_id;
    SET average_weighted_score = total_score / total_weight;
    INSERT INTO average_weighted_score (user_id, score) VALUES (user_id, average_weighted_score);
END;
