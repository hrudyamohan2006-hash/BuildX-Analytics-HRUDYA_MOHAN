-- Show all deliveries where Virat Kohli batted

SELECT *
FROM cleaned
WHERE batter='Virat Kohli';


-- Calculate the total runs scored by each batting team

SELECT batting_team,SUM(batter_runs_scor) AS Total_Runs
FROM cleaned
GROUP BY batting_team;


-- Display the top 10 run scorers

SELECT batter,SUM(batter_runs_scor) AS Total_Runs
FROM cleaned
GROUP BY batter
ORDER BY Total_Runs DESC
LIMIT 10;


-- Display players who have scored more than 1000 runs

SELECT batter,SUM(batter_runs_scor) AS Total_Runs
FROM cleaned
GROUP BY batter
HAVING SUM(batter_runs_scor)>1000;


-- Show matches played between 2020 and 2023

SELECT DISTINCT match_id,date,venue,year
FROM cleaned
WHERE year BETWEEN 2020 AND 2023;


-- Analyze batting team performance after 2020 by calculating matches played, total runs and average runs per ball

SELECT batting_team,
COUNT(DISTINCT match_id) AS Matches_Played,
SUM(batter_runs_scor) AS Total_Runs,
ROUND(AVG(batter_runs_scor),2) AS Average_Runs_Per_Ball
FROM cleaned
WHERE year>=2020
GROUP BY batting_team
HAVING COUNT(DISTINCT match_id)>5
ORDER BY Total_Runs DESC;