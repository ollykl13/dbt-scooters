WITH count_company_trips AS (
	SELECT 
		s.company
		,count(*) AS cnt_trips
	FROM {{ ref("trips_prep") }} AS t
	    JOIN {{ ref("scooters") }} AS s
	        ON s.hardware_id = t.scooter_hw_id
	GROUP BY 
	 	1
 )	
 SELECT 
 	ct.company 
    ,ct.cnt_trips
    ,c.scooters
 	,ct.cnt_trips / cast(c.scooters as float) AS trips_per_scooter 
 FROM count_company_trips AS ct 
 	JOIN {{ ref("companies") }} AS c 
 	    ON c.company = ct.company 
 	
 