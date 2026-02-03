-- sql/02_marts/01_dim_customers.sql
-- Customer dimension (1 row per customer)

CREATE OR REPLACE TABLE marts.dim_customers AS
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_prefix,
    customer_city,
    customer_state
FROM staging.stg_customers;