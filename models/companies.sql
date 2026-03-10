SELECT 
	company
	,count(model) AS models
	,sum(scooters) AS scooters
FROM {{ ref("scooters") }}
GROUP BY 
	1