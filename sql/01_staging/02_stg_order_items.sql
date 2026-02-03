CREATE OR REPLACE VIEW staging.stg_order_items AS
SELECT
  order_id::VARCHAR        AS order_id,
  order_item_id::INTEGER   AS order_item_id,
  product_id::VARCHAR      AS product_id,
  seller_id::VARCHAR       AS seller_id,
  CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_ts,

  price::DOUBLE            AS price,
  freight_value::DOUBLE    AS freight_value
FROM raw.order_items;