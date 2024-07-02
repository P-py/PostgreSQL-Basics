SELECT * FROM athlete;

SELECT
	id AS Registro,
	athlete_name AS Atleta,
	jersey_number AS Numero
	FROM athlete;

INSERT INTO athlete(athlete_name, jersey_number, bio, age, height, active, birth_date, pro_debut)
	VALUES 
		('Chris Paul', '3', 'Allergic to winning a title.', 39, 1.83, TRUE, '1985-05-06', '2005-11-01 21:30:00'), 
		('Bronny James', '9', 'Just LeBron son, shouldnt be on the NBA.', 19, 1.88, TRUE, '2004-10-06', null)
		('Giannis Sina Ugo Antetokounmpo', '34', 'The greek freak', 29, 2.11, TRUE, '1994-12-06', '2013-10-13 19:30:00');

SELECT * FROM athlete
	WHERE athlete_name != 'Chris Paul'

-- Text filtering with % and _ only works with LIKE operator, = reads the filters as normal char
	
SELECT *
	FROM athlete
	-- Could use _ to indicate a generic letter instead of a word in %
	WHERE athlete_name LIKE '% James';

SELECT *
	FROM athlete
	WHERE athlete_name NOT LIKE '% Jordan'; 

SELECT *
	FROM athlete
	WHERE pro_debut IS NULL;

SELECT *
	FROM athlete
	WHERE pro_debut IS NOT NULL;

SELECT *
	FROM athlete
	WHERE height BETWEEN CAST(1.85 AS REAL) AND CAST(2.00 AS REAL);