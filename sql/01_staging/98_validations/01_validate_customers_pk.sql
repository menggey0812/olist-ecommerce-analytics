-- Fail conditions:
-- 1) customer_id is NULL
-- 2) customer_id is duplicated

WITH null_keys AS (
    SELECT customer_id
    FROM staging.stg_customers
    WHERE customer_id IS NULL
    LIMIT 50
),
dup_keys AS (
    SELECT customer_id, COUNT(*) AS cnt
    FROM staging.stg_customers
    GROUP BY 1
    HAVING COUNT(*) > 1
    LIMIT 50
)
SELECT 'NULL_CUSTOMER_ID' AS issue, * FROM null_keys
UNION ALL
SELECT 'DUP_CUSTOMER_ID' AS issue, customer_id FROM dup_keys;