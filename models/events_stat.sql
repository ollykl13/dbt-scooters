SELECT
	count("type" = 'cancel_search' OR NULL) * 100.0 / count("type" = 'start_search' OR NULL) AS cancel_pct
FROM  {{ ref("events_full") }}