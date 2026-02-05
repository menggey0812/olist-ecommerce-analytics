-- Null rates + duplicate checks on primary / natural keys
-- Profiling only (not validation)

-- Customers
SELECT
  'staging.stg_customers' AS table_name,
  COUNT(*) AS total_rows,
  COUNT(DISTINCT customer_id) AS distinct_customer_ids,
  COUNT(*) - COUNT(DISTINCT customer_id) AS duplicate_customer_ids,
  SUM(customer_id IS NULL)::INT AS null_customer_ids
FROM staging.stg_customers;

-- Orders
SELECT
  'staging.stg_orders' AS table_name,
  COUNT(*) AS total_rows,
  COUNT(DISTINCT order_id) AS distinct_order_ids,
  COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_order_ids,
  SUM(order_id IS NULL)::INT AS null_order_ids
FROM staging.stg_orders;

-- Order items (composite key)
SELECT
  'staging.stg_order_items' AS table_name,
  COUNT(*) AS total_rows,
  COUNT(DISTINCT order_id || '|' || order_item_id) AS distinct_keys,
  COUNT(*) - COUNT(DISTINCT order_id || '|' || order_item_id) AS duplicate_keys
FROM staging.stg_order_items;