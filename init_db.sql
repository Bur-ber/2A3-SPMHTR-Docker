CREATE DATABASE IF NOT EXISTS spmhtr_database;
USE spmhtr_database;

CREATE TABLE IF NOT EXISTS Articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(80) NOT NULL
);

INSERT INTO Articles (title) VALUES
('Article 1'),
('Article 2'),
('Article 3');