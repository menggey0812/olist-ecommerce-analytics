-- sql/02_marts/04_fact_order_items.sql
-- Order items fact (1 row per item line)

CREATE OR REPLACE TABLE marts.fact_order_items AS
SELECT
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,

    oi.shipping_limit_ts,
    oi.price,
    oi.freight_value,

    -- convenience metric used a lot in BI
    (oi.price + oi.freight_value) AS item_total_value

FROM staging.stg_order_items oi;