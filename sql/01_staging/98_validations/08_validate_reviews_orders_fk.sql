-- sql/01_staging/98_validations/08_validate_reviews_orders_fk.sql
-- Fail condition:
--   review.order_id does not exist in orders

SELECT
  r.order_id
FROM staging.stg_reviews r
LEFT JOIN staging.stg_orders o
  ON r.order_id = o.order_id
WHERE r.order_id IS NOT NULL
  AND o.order_id IS NULL
LIMIT 50;