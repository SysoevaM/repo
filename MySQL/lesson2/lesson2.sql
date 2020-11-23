DROP DATABASE IF EXISTS example;
DROP DATABASE IF EXISTS sample;

CREATE DATABASE example;
CREATE DATABASE sample;

USE example;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
id SERIAL PRIMARY KEY, 
name VARCHAR(255)
);

INSERT INTO users VALUES  
(default, 'Ivan'),
(default, 'Maria');