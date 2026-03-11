SELECT 
	ag.group AS age_group
	,count(*) AS trips
	,sum(price_rub) AS revenue_rub
FROM {{ ref("trips_users") }} AS u
	CROSS JOIN {{ ref("age_groups") }} AS ag
WHERE 
    u.age >= ag.age_start 
    AND u.age <= ag.age_end	
GROUP BY 
	1