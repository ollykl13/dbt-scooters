SELECT DISTINCT 
    first_name
    , sex
FROM {{ source("scooters_raw", "users") }}
WHERE sex IS NOT NULL
ORDER BY 
    1
