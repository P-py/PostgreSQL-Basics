SELECT NOW();

integer
real
serial
numeric

varchar(n)
char(n)
text

boolean

date
time
timestamp

CREATE DATABASE stats_basketball;

CREATE TABLE athlete(
	id SERIAL PRIMARY KEY,
	athlete_name VARCHAR(255),
	jersey_number CHAR(2),
	bio TEXT,
	age INTEGER,
	height REAL,
	active BOOLEAN,
	birth_date DATE,
	pro_debut TIMESTAMP
);

SELECT * FROM athlete;

DROP TABLE athlete;