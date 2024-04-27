--  SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes
--  and store the average weighted score for all students.
-- Procedure ComputeAverageWeightedScoreForUsers is not taking any input.
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers
BEGIN
    DECLARE total_weighted_score DECIMAL(10, 2);
    DECLARE total_weight DECIMAL(10, 2);

    -- Calculate the total weighted score for all students
    SELECT SUM(score * weight) INTO total_weighted_score
    FROM corrections;

    -- Calculate the total weight (sum of weights)
    SELECT SUM(weight) INTO total_weight
    FROM corrections;

    -- Compute the average weighted score
    DECLARE avg_weighted_score DECIMAL(10, 2);
    SET avg_weighted_score = total_weighted_score / total_weight;

    -- Store the result (you can adjust the target table and columns)
    INSERT INTO average_weighted_scores (score)
    VALUES (avg_weighted_score);
END;
