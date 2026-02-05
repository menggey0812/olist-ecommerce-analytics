-- sql/profiling/00_row_counts.sql
-- Row counts by schema/table (high level sanity check)

SELECT 'raw.customers' AS object, COUNT(*) AS row_count FROM raw.customers
UNION ALL SELECT 'raw.orders', COUNT(*) FROM raw.orders
UNION ALL SELECT 'raw.order_items', COUNT(*) FROM raw.order_items
UNION ALL SELECT 'raw.products', COUNT(*) FROM raw.products
UNION ALL SELECT 'raw.sellers', COUNT(*) FROM raw.sellers
UNION ALL SELECT 'raw.order_payments', COUNT(*) FROM raw.order_payments
UNION ALL SELECT 'raw.order_reviews', COUNT(*) FROM raw.order_reviews
UNION ALL SELECT 'raw.product_category_translation', COUNT(*) FROM raw.product_category_translation

UNION ALL SELECT 'staging.stg_customers', COUNT(*) FROM staging.stg_customers
UNION ALL SELECT 'staging.stg_orders', COUNT(*) FROM staging.stg_orders
UNION ALL SELECT 'staging.stg_order_items', COUNT(*) FROM staging.stg_order_items
UNION ALL SELECT 'staging.stg_products', COUNT(*) FROM staging.stg_products
UNION ALL SELECT 'staging.stg_sellers', COUNT(*) FROM staging.stg_sellers
UNION ALL SELECT 'staging.stg_payments', COUNT(*) FROM staging.stg_payments
UNION ALL SELECT 'staging.stg_reviews', COUNT(*) FROM staging.stg_reviews

UNION ALL SELECT 'marts.dim_customers', COUNT(*) FROM marts.dim_customers
UNION ALL SELECT 'marts.dim_products', COUNT(*) FROM marts.dim_products
UNION ALL SELECT 'marts.dim_sellers', COUNT(*) FROM marts.dim_sellers
UNION ALL SELECT 'marts.fact_orders', COUNT(*) FROM marts.fact_orders
UNION ALL SELECT 'marts.fact_order_items', COUNT(*) FROM marts.fact_order_items
ORDER BY object;