INSERT INTO athlete(athlete_name, jersey_number, bio, age, height, active, birth_date, pro_debut)
	VALUES ('Michael Jordan', 
			'23', 
			'THE GREATEST OF ALL TIME - A.K.A GOAT. Better than LeBron. Six times NBA Champ, 6/6, 100% eFG% when we talk about championships. Although we need to say that he is not the best when it comes to being a GM or franchise owner LOL.',
			61,
			1.98,
			FALSE, --TRUE, FALSE OR NULL
			'1963-02-17', --yyyy-mm-dd (date format)
			--HH24:MI:SS (time format)
			'1984-10-26 19:30:00' --yyyy-mm-dd HH24:MI:SS (timestamp format)
			);

SELECT id, athlete_name, jersey_number, age, height, active, birth_date, pro_debut FROM athlete
	WHERE athlete_name = 'Michael Jordan' AND jersey_number = '23';

UPDATE athlete 
	SET athlete_name = 'Michael Jeffrey Jordan',
	bio = 'THE GREATEST OF ALL TIME - A.K.A GOAT. Better than LeBron. Six times NBA Champ, 6/6, 100% eFG% when we talk about championships. Although we should say that he is not the best when it comes to being a GM or franchise owner, shoutout to the Hornets LOL.'
	WHERE athlete_name = 'Michael Jordan' AND jersey_number = '23';

SELECT * FROM athlete;

INSERT INTO athlete(athlete_name, jersey_number, bio, age, height, active, birth_date, pro_debut)
	VALUES ('LeBron James', 
			'23', --Copying the goat, just saying
			'Don"t really like LeBron that much to write a bio about him.',
			39,
			2.06,
			TRUE,
			'1984-12-30',
			'2003-10-29 19:30:00'
			);

SELECT * FROM athlete
	WHERE height = CAST(2.06 AS REAL);

SELECT * FROM athlete
	WHERE (athlete_name, height) IN (SELECT athlete_name, height FROM athlete WHERE athlete_name = 'LeBron James' AND height = CAST(2.06 AS REAL));

DELETE FROM athlete
	WHERE (athlete_name, height) IN (SELECT athlete_name, height FROM athlete WHERE athlete_name = 'LeBron James' AND height = CAST(2.06 AS REAL))
	RETURNING *;

SELECT * FROM athlete;