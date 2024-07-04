CREATE TABLE teams(
	id SERIAL PRIMARY KEY,
	team_name VARCHAR(60) NOT NULL,
	bio TEXT,
	fundation DATE NOT NULL,
	home_location TEXT NOT NULL,
	titles INTEGER NOT NULL
);

ALTER TABLE teams RENAME COLUMN fundation TO foundation;

INSERT INTO teams(team_name, bio, foundation, home_location, titles)
	VALUES
	('Chicago Bulls', '-', '1966-01-16', 'Chicago, Illinois', 6),
	('Los Angeles Lakers', '-', '1947-01-01', 'Los Angeles, California', 17),
	('San Antonio Spurs', '-', '1973-10-10', 'San Antonio, Texas', 5),
	('Milwaukee Bucks', '-', '1968-01-22', 'Milwaukee, Wisconsin', 2);

SELECT * FROM athlete;
SELECT * FROM teams;

ALTER TABLE athlete 
	ADD COLUMN last_team_id INT
	CONSTRAINT teams_athlete_fk_last_team_id 
	REFERENCES teams(id)
	ON UPDATE CASCADE ON DELETE CASCADE;

UPDATE athlete
	SET last_team_id = 2
	WHERE athlete_name LIKE '% James';

UPDATE athlete
	SET last_team_id = 1
	WHERE athlete_name LIKE '% Jordan';

UPDATE athlete
	SET last_team_id = 3
	WHERE athlete_name LIKE '% Paul';

UPDATE athlete
	SET last_team_id = 4
	WHERE athlete_name LIKE 'Giannis %';

SELECT athlete.*, teams.team_name
	FROM athlete
	JOIN teams ON teams.id = athlete.last_team_id