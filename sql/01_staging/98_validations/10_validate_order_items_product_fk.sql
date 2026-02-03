-- sql/01_staging/98_validations/10_validate_order_items_product_fk.sql
-- Validate FK: staging.stg_order_items.product_id → staging.stg_products.product_id

SELECT
    'staging.stg_order_items (FK/product_id)' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE p.product_id IS NULL) AS missing_product_fk_rows
FROM staging.stg_order_items oi
LEFT JOIN staging.stg_products p
    ON oi.product_id = p.product_id
WHERE oi.product_id IS NOT NULL
HAVING COUNT(*) FILTER (WHERE p.product_id IS NULL) > 0;