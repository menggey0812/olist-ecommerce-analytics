CREATE OR REPLACE VIEW staging.stg_customers AS
SELECT
  customer_id::VARCHAR         AS customer_id,
  customer_unique_id::VARCHAR  AS customer_unique_id,
  customer_zip_code_prefix::VARCHAR AS customer_zip_prefix,
  customer_city::VARCHAR       AS customer_city,
  customer_state::VARCHAR      AS customer_state
FROM raw.customers;