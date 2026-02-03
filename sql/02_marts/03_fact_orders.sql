-- sql/02_marts/03_fact_orders.sql
-- Orders fact (1 row per order)

CREATE OR REPLACE TABLE marts.fact_orders AS
WITH payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS total_payment_value,
        MAX(payment_installments) AS max_installments
    FROM staging.stg_payments
    GROUP BY 1
),
reviews AS (
    SELECT
        order_id,
        AVG(review_score) AS avg_review_score
    FROM staging.stg_reviews
    GROUP BY 1
)
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,

    o.order_purchase_ts,
    o.order_approved_ts,
    o.delivered_carrier_ts,
    o.delivered_customer_ts,
    o.estimated_delivery_ts,

    p.total_payment_value,
    p.max_installments,
    r.avg_review_score

FROM staging.stg_orders o
LEFT JOIN payments p ON o.order_id = p.order_id
LEFT JOIN reviews  r ON o.order_id = r.order_id;