SELECT 
	ec.*
	,et.type
FROM {{ ref("events_clean") }} AS ec
	LEFT JOIN {{ ref("event_types") }} AS et 
		ON et.type_id = ec.type_id