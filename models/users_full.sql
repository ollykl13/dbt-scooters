SELECT
    u.id,
    u.first_name,
    u.last_name,
    u.phone,
    COALESCE(s.sex, sm.sex) AS sex,
    u.birth_date
FROM {{ source("scooters_raw", "users") }} AS u
LEFT JOIN {{ ref("first_name_sex") }} AS s
    ON u.first_name = s.first_name
LEFT JOIN {{ ref("first_name_sex_manual") }} AS sm
    ON u.first_name = sm.first_name
ORDER BY
    1
