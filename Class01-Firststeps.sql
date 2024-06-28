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

CREATE TABLE athlete(
	id SERIAL PRIMARY KEY,
	athleteName VARCHAR(255),
	jerseyNumber CHAR(2),
	bio TEXT,
	age INTEGER,
	height REAL,
	active BOOLEAN,
	birthDate DATE,
	proDebut TIMESTAMP
);

SELECT * FROM athlete;