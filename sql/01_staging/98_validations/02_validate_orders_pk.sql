WITH null_keys AS (
    SELECT order_id
    FROM staging.stg_orders
    WHERE order_id IS NULL
    LIMIT 50
),
dup_keys AS (
    SELECT order_id, COUNT(*) AS cnt
    FROM staging.stg_orders
    GROUP BY 1
    HAVING COUNT(*) > 1
    LIMIT 50
)
SELECT 'NULL_ORDER_ID' AS issue, * FROM null_keys
UNION ALL
SELECT 'DUP_ORDER_ID' AS issue, order_id FROM dup_keys;