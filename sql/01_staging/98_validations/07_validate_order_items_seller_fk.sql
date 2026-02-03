-- sql/01_staging/98_validations/07_validate_order_items_seller_fk.sql
-- Fail condition:
--   seller_id in order_items does not exist in sellers

SELECT
  oi.seller_id
FROM staging.stg_order_items oi
LEFT JOIN staging.stg_sellers s
  ON oi.seller_id = s.seller_id
WHERE oi.seller_id IS NOT NULL
  AND s.seller_id IS NULL
LIMIT 50;