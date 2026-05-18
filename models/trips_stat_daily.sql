SELECT
    t."date" AS date,
    count(t.*) AS trips,
    max(t.price_rub) AS max_price_rub,
    avg(t.distance_m) / 1000 AS avg_distance_km,
    avg(t.price_rub) / avg(t.duration_s) * 60 AS avg_price_rub_per_min
FROM {{ ref("trips_prep") }} AS t
GROUP BY 1
ORDER BY 1
