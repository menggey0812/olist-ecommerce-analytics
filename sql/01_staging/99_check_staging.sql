-- sql/01_staging/99_check_staging.sql
-- Verify staging views exist

SELECT table_schema, table_name
FROM information_schema.views
WHERE table_schema = 'staging'
ORDER BY table_name;

-- Row count spot-checks (optional)
SELECT 'stg_orders' AS view_name, COUNT(*) AS row_count FROM staging.stg_orders
UNION ALL
SELECT 'stg_order_items', COUNT(*) FROM staging.stg_order_items
UNION ALL
SELECT 'stg_customers', COUNT(*) FROM staging.stg_customers
UNION ALL
SELECT 'stg_products', COUNT(*) FROM staging.stg_products
UNION ALL
SELECT 'stg_sellers', COUNT(*) FROM staging.stg_sellers
UNION ALL
SELECT 'stg_payments', COUNT(*) FROM staging.stg_payments
UNION ALL
SELECT 'stg_reviews', COUNT(*) FROM staging.stg_reviews;