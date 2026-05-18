SELECT
    u.id,
    u.sex,
    u.birth_date
FROM {{ source("scooters_raw", "users") }} AS u
