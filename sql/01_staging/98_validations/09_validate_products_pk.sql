-- sql/01_staging/98_validations/09_validate_products_pk.sql
-- Fail conditions:
-- 1) product_id is NULL
-- 2) product_id is duplicated

WITH null_keys AS (
  SELECT product_id
  FROM staging.stg_products
  WHERE product_id IS NULL
  LIMIT 50
),
dup_keys AS (
  SELECT product_id, COUNT(*) AS cnt
  FROM staging.stg_products
  GROUP BY 1
  HAVING COUNT(*) > 1
  LIMIT 50
)
SELECT 'NULL_PRODUCT_ID' AS issue, * FROM null_keys
UNION ALL
SELECT 'DUP_PRODUCT_ID'  AS issue, product_id FROM dup_keys;