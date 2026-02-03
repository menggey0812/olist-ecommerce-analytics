SELECT
    p.order_id
FROM staging.stg_payments p
LEFT JOIN staging.stg_orders o
    ON p.order_id = o.order_id
WHERE o.order_id IS NULL
LIMIT 50;