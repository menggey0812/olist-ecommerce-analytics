-- Fail condition:
-- payments.order_id exists but does not exist in orders

SELECT
    p.order_id
FROM staging.stg_payments p
LEFT JOIN staging.stg_orders o
    ON p.order_id = o.order_id
WHERE p.order_id IS NOT NULL
  AND o.order_id IS NULL
LIMIT 50;