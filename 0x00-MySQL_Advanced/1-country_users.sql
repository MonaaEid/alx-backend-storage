-- SQL script that creates a table users with a country column
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
