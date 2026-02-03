-- sql/02_marts/99_check_marts.sql
-- Smoke test: do marts tables exist + basic row-count sanity

-- 1a) Verify marts tables exist
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'marts'
ORDER BY table_name;

-- 1b) Expected table list check (shows missing ones)
WITH expected(table_name) AS (
    SELECT * FROM (VALUES
        ('dim_customers'),
        ('dim_products'),
        ('dim_sellers'),
        ('fact_orders'),
        ('fact_order_items')
    ) v(table_name)
),
existing AS (
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'marts'
)
SELECT e.table_name AS missing_table
FROM expected e
LEFT JOIN existing x ON e.table_name = x.table_name
WHERE x.table_name IS NULL;

-- 2) Row count spot-checks (sanity only)
SELECT 'dim_customers'    AS table_name, COUNT(*) AS row_count FROM marts.dim_customers
UNION ALL
SELECT 'dim_products'     AS table_name, COUNT(*) AS row_count FROM marts.dim_products
UNION ALL
SELECT 'dim_sellers'      AS table_name, COUNT(*) AS row_count FROM marts.dim_sellers
UNION ALL
SELECT 'fact_orders'      AS table_name, COUNT(*) AS row_count FROM marts.fact_orders
UNION ALL
SELECT 'fact_order_items' AS table_name, COUNT(*) AS row_count FROM marts.fact_order_items
ORDER BY table_name;

