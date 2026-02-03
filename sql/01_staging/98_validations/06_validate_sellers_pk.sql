-- sql/01_staging/98_validations/06_validate_sellers_pk.sql
-- Fail conditions:
--   1) seller_id is NULL
--   2) seller_id is duplicated

WITH null_keys AS (
  SELECT seller_id
  FROM staging.stg_sellers
  WHERE seller_id IS NULL
  LIMIT 50
),
dup_keys AS (
  SELECT seller_id, COUNT(*) AS cnt
  FROM staging.stg_sellers
  GROUP BY seller_id
  HAVING COUNT(*) > 1
  LIMIT 50
)
SELECT 'NULL_SELLER_ID' AS issue, seller_id
FROM null_keys

UNION ALL

SELECT 'DUP_SELLER_ID' AS issue, seller_id
FROM dup_keys;