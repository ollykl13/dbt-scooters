SELECT 
	u.id
	,u.first_name
	,u.last_name
	,u.phone
	,COALESCE(s.sex, sm.sex) AS sex
	,u.birth_date
FROM {{ source("scooters_raw", "users") }} AS u
LEFT JOIN {{ ref("first_name_sex") }} AS s
	ON s.first_name = u.first_name 
LEFT JOIN {{ ref("first_name_sex_manual") }} AS sm
	ON sm.first_name = u.first_name
ORDER BY 
	1