-- SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
CREATE PROCEDURE AddBonus(
    user_id INT,
    project_name VARCHAR(255),
    score FLOAT
)
BEGIN
    DECLARE bonus FLOAT;
    DECLARE new_score FLOAT;
    SELECT score INTO bonus FROM corrections WHERE project = project_name;
    SELECT score INTO new_score FROM corrections WHERE project = project_name AND user_id = user_id;
    IF new_score IS NULL THEN
        INSERT INTO corrections (user_id, project, score) VALUES (user_id, project_name, score + bonus);
    ELSE
        UPDATE corrections SET score = score + bonus WHERE user_id = user_id AND project = project_name;
    END IF;
END;
