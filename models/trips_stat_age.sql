WITH 
date_age_cte AS (
	SELECT 
		date(t.started_at) AS date
		,date_part('year', age(t.started_at, u.birth_date)) AS age
	FROM scooters_raw.trips AS t
		INNER JOIN scooters_raw.users AS u
			ON u.id = t.user_id
)
,count_cte AS (
	SELECT 
		date 
		,age
		,count(*) AS trips
	FROM date_age_cte
	GROUP BY 
		date 
		,age
)
SELECT
	age
	,avg(trips) AS avg_trips
FROM count_cte
GROUP BY 
	age
ORDER BY 
	age