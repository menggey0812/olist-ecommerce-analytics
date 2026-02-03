-- Fail condition:
-- order_items.order_id exists but does not exist in orders

SELECT
    oi.order_id
FROM staging.stg_order_items oi
LEFT JOIN staging.stg_orders o
    ON oi.order_id = o.order_id
WHERE oi.order_id IS NOT NULL
  AND o.order_id IS NULL
LIMIT 50;