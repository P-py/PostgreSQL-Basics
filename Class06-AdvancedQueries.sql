SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY id;

-- Will order the rows from the highest age to the lowest age
-- DESC -> descending
-- ASC -> ascending order
SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY age DESC;

-- Will order the rows first by jersey_number than by age, showing the Jordan and LeBron rows together but with LeBron first.
SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY jersey_number, age ASC;

-- Will order the rows first by jersey_number than by age, showing the Jordan and LeBron rows together but with Jordan first cause of descending age order.
SELECT athlete.*, teams.team_name
	FROM athlete
	LEFT JOIN teams ON teams.id = athlete.last_team_id
	ORDER BY jersey_number, age DESC;

SELECT
	teams.team_name,
	COUNT(athlete.id)
FROM athlete
LEFT JOIN teams ON teams.id = athlete.last_team_id
GROUP BY teams.team_name
HAVING COUNT(athlete.id) > 1;