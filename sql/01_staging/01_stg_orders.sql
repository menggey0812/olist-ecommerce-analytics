CREATE OR REPLACE VIEW staging.stg_orders AS
SELECT
  order_id::VARCHAR                    AS order_id,
  customer_id::VARCHAR                 AS customer_id,
  order_status::VARCHAR                AS order_status,

  -- timestamps (cast to TIMESTAMP)
  CAST(order_purchase_timestamp AS TIMESTAMP)        AS order_purchase_ts,
  CAST(order_approved_at AS TIMESTAMP)               AS order_approved_ts,
  CAST(order_delivered_carrier_date AS TIMESTAMP)    AS delivered_carrier_ts,
  CAST(order_delivered_customer_date AS TIMESTAMP)   AS delivered_customer_ts,
  CAST(order_estimated_delivery_date AS TIMESTAMP)   AS estimated_delivery_ts
FROM raw.orders;