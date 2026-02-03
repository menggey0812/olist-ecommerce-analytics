-- Orders without a matching customer (FK integrity)
SELECT
    o.order_id,
    o.customer_id
FROM staging.stg_orders o
LEFT JOIN staging.stg_customers c
    ON o.customer_id = c.customer_id
WHERE o.customer_id IS NOT NULL
  AND c.customer_id IS NULL
LIMIT 50;