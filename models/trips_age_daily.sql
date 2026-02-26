WITH 
date_age_cte AS (
	SELECT 
		t.*
		,date_part('year', age(t.started_at, u.birth_date)) AS age
	FROM {{ ref("trips_prep") }} AS t
		INNER JOIN {{ source("scooters_raw", "users") }} AS u
			ON u.id = t.user_id
)
SELECT 
    date 
    ,age
    ,count(*) AS trips
    ,sum(price_rub) AS revenue_rub
FROM date_age_cte
GROUP BY 
    date 
    ,age
