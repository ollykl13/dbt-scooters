WITH count_company_trips AS (
    SELECT
        s.company,
        count(*) AS cnt_trips
    FROM {{ ref("trips_prep") }} AS t
    INNER JOIN {{ ref("scooters") }} AS s
        ON t.scooter_hw_id = s.hardware_id
    GROUP BY
        1
)

SELECT
    ct.company,
    ct.cnt_trips,
    c.scooters,
    ct.cnt_trips / cast(c.scooters AS float) AS trips_per_scooter
FROM count_company_trips AS ct
INNER JOIN {{ ref("companies") }} AS c
    ON ct.company = c.company
