SELECT
    oi.order_id
FROM staging.stg_order_items oi
LEFT JOIN staging.stg_orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL
LIMIT 50;