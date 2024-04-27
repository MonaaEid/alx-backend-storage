-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser 
-- that computes and store the average weighted score for a student.
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE total_weighted_score DECIMAL(10, 2);
    DECLARE total_weight DECIMAL(10, 2);

    -- Calculate the total weighted score for the user
    SELECT SUM(score * weight) INTO total_weighted_score
    FROM corrections
    WHERE user_id = user_id;

    -- Calculate the total weight (sum of weights)
    SELECT SUM(weight) INTO total_weight
    FROM corrections
    WHERE user_id = user_id;

    -- Compute the average weighted score
    DECLARE avg_weighted_score DECIMAL(10, 2);
    SET avg_weighted_score = total_weighted_score / total_weight;

    -- Store the result (you can adjust the target table and columns)
    INSERT INTO average_weighted_scores (user_id, score)
    VALUES (user_id, avg_weighted_score);
END;
