-- sql/01_staging/99_check_staging.sql
-- Smoke test: do staging views exist + basic row-count sanity

-- 1a) Verify staging views exist
SELECT table_schema, table_name
FROM information_schema.views
WHERE table_schema = 'staging'
ORDER BY table_name;

-- 1b) Expected view list check (shows missing ones)
WITH expected(view_name) AS (
    SELECT * FROM (VALUES
        ('stg_customers'),
        ('stg_orders'),
        ('stg_order_items'),
        ('stg_products'),
        ('stg_sellers'),
        ('stg_payments'),
        ('stg_reviews')
    ) v(view_name)
),
existing AS (
    SELECT table_name AS view_name
    FROM information_schema.views
    WHERE table_schema = 'staging'
)
SELECT e.view_name AS missing_view
FROM expected e
LEFT JOIN existing x ON e.view_name = x.view_name
WHERE x.view_name IS NULL;

-- 2) Row count spot-checks (sanity only)
SELECT 'stg_orders'       AS view_name, COUNT(*) AS row_count FROM staging.stg_orders
UNION ALL
SELECT 'stg_order_items'  AS view_name, COUNT(*) AS row_count FROM staging.stg_order_items
UNION ALL
SELECT 'stg_customers'    AS view_name, COUNT(*) AS row_count FROM staging.stg_customers
UNION ALL
SELECT 'stg_products'     AS view_name, COUNT(*) AS row_count FROM staging.stg_products
UNION ALL
SELECT 'stg_sellers'      AS view_name, COUNT(*) AS row_count FROM staging.stg_sellers
UNION ALL
SELECT 'stg_payments'     AS view_name, COUNT(*) AS row_count FROM staging.stg_payments
UNION ALL
SELECT 'stg_reviews'      AS view_name, COUNT(*) AS row_count FROM staging.stg_reviews
ORDER BY view_name;