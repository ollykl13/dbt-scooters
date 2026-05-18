SELECT
    ec.*,
    et."type",
    date(ec."timestamp") AS "date"
FROM {{ ref("events_clean") }} AS ec
LEFT JOIN {{ ref("event_types") }} AS et
    ON ec.type_id = et.type_id
