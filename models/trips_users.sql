SELECT 
	t.*
	,u.sex 
	,date_part('year', age(t.date, u.birth_date)) AS age
FROM {{ ref("trips_prep") }} AS t
	LEFT JOIN {{ source("scooters_raw", "users") }} AS u 
		ON u.id = t.user_id
{% if is_incremental() %}
    WHERE
        t.id > (SELECT max(id) FROM {{ this }})
    ORDER BY
        t.id
    LIMIT
        75000
{% else %}
    WHERE
        t.id <= 75000
{% endif %}       