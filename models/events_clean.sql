SELECT DISTINCT
	user_id 
	,"timestamp" 
	,type_id
	,{{ updated_at() }}
FROM {{ source("scooters_raw", "events") }}
{% if is_incremental() %}
WHERE
    "timestamp" > (SELECT max("timestamp") FROM {{ this }})
{% else %}
WHERE
    "timestamp" < '2023-08-01'::date
{% endif %}
