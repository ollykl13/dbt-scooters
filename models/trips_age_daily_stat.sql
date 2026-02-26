SELECT
	age
	,avg(trips) AS avg_trips
    ,avg(revenue_rub) AS avg_revenue_rub
FROM {{ ref("trips_age_daily") }}
GROUP BY 
	age
ORDER BY 
	age