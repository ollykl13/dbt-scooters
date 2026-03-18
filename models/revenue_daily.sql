SELECT 
	sum(price_rub) AS revenue_rub
    ,"date" 
    ,{{ updated_at() }}
FROM {{ ref("trips_prep") }}
{% if is_incremental() %}
WHERE
    "date" >= (SELECT max("date") - interval '2' day FROM {{ this }})
{% else %}
{% endif %}
GROUP BY 
	2
    ,3
ORDER BY 
	2