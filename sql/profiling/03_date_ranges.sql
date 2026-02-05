-- Date range coverage and obvious anomalies

-- Orders: overall min/max
SELECT
  MIN(order_purchase_ts) AS min_purchase_ts,
  MAX(order_purchase_ts) AS max_purchase_ts,
  MIN(order_approved_ts) AS min_approved_ts,
  MAX(order_approved_ts) AS max_approved_ts
FROM staging.stg_orders;

-- Illogical sequences: approval before purchase
SELECT COUNT(*) AS bad_rows
FROM staging.stg_orders
WHERE
  order_purchase_ts IS NOT NULL
  AND order_approved_ts IS NOT NULL
  AND order_approved_ts < order_purchase_ts;

-- Delivery before purchase
SELECT COUNT(*) AS delivered_before_purchase
FROM staging.stg_orders
WHERE
  delivered_customer_ts IS NOT NULL
  AND order_purchase_ts IS NOT NULL
  AND delivered_customer_ts < order_purchase_ts;