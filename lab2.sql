CREATE DATABASE lab2;

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('Argentina', 1, 38000000);

INSERT INTO countries (country_id, country_name)
VALUES (10, 'United Kingdom');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Germany', NULL, 83000000);

INSERT INTO countries (country_name, region_id, population)
VALUES
    ('Japan', 2, 125000000),
    ('Brazil', 3, 214000000),
    ('Italy', 1, 59000000);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name, region_id, population)
VALUES (DEFAULT, 4, 18000000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

INSERT INTO countries_new
SELECT * FROM countries;

UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

UPDATE countries
SET population = population * 1.10
RETURNING country_name, population AS "New Population";

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;