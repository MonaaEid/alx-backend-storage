--  SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes
--  and store the average weighted score for all students.
-- Procedure ComputeAverageWeightedScoreForUsers is not taking any input.

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id INT;
    DECLARE average_score FLOAT;
    DECLARE average_weighted_score FLOAT;
    DECLARE total_score FLOAT;
    DECLARE total_weight FLOAT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT user_id FROM corrections GROUP BY user_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO user_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT AVG(score) INTO average_score FROM corrections WHERE user_id = user_id;
        SELECT SUM(score) INTO total_score FROM corrections WHERE user_id = user_id;
        SELECT SUM(weight) INTO total_weight FROM corrections WHERE user_id = user_id;
        SET average_weighted_score = total_score / total_weight;
        INSERT INTO average_weighted_score (user_id, score) VALUES (user_id, average_weighted_score);
    END LOOP;
    CLOSE cur;
END;
