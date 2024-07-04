SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY id;

-- Will order the rows from the highest age to the lowest age
-- DESC -> descending
SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY age DESC;

-- Will order the rows first by jersey_number than by age, showing the Jordan and LeBron rows together but with LeBron first.
SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY jersey_number, age;