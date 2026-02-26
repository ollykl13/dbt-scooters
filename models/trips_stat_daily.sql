SELECT 
	date(started_at) AS date
	,count(*) AS trips
	,max(price)/100 AS max_price_rub
	,avg(distance)/1000 AS avg_distance_km
FROM scooters_raw.trips
GROUP BY date(started_at)
ORDER BY date(started_at)