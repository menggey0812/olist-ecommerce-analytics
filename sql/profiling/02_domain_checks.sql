-- Domain / categorical distribution checks

-- Order status distribution
SELECT order_status, COUNT(*) AS cnt
FROM staging.stg_orders
GROUP BY 1
ORDER BY cnt DESC;

-- Payment type distribution
SELECT payment_type, COUNT(*) AS cnt
FROM staging.stg_payments
GROUP BY 1
ORDER BY cnt DESC;

-- Review score distribution
SELECT review_score, COUNT(*) AS cnt
FROM staging.stg_reviews
GROUP BY 1
ORDER BY review_score;