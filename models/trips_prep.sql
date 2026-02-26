SELECT 
	id
	,user_id 
	,scooter_hw_id
	,started_at
	,finished_at
	,start_lat
	,start_lon
	,finish_lat
	,finish_lon
	,distance AS distance_m
	,CAST(price as decimal(20,2)) / 100 AS price_rub
	,EXTRACT(EPOCH FROM (finished_at - started_at)) AS duration_s
	,finished_at <> started_at AND price = 0 AS is_free
	,date(started_at) AS date
FROM {{ source("scooters_raw", "trips") }}