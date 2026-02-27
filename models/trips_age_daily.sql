SELECT 
    date 
    ,age
    ,count(*) AS trips
    ,sum(price_rub) AS revenue_rub
FROM {{ ref("trips_users") }}
GROUP BY 
    1 
    ,2
