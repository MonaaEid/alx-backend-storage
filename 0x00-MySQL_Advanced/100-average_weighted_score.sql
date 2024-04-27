-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser 
-- that computes and store the average weighted score for a student.
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score DECIMAL(10,2);
    DECLARE total_weight DECIMAL(10,2);
    DECLARE average_score DECIMAL(10,2);
    
    SELECT SUM(score * weight) INTO total_score, SUM(weight) INTO total_weight
    FROM scores
    WHERE user_id = user_id;
    
    IF total_weight IS NOT NULL AND total_weight > 0 THEN
        SET average_score = total_score / total_weight;
    ELSE
        SET average_score = 0;
    END IF;
    
    INSERT INTO average_scores (user_id, average_score)
    VALUES (user_id, average_score);
END //

DELIMITER ;