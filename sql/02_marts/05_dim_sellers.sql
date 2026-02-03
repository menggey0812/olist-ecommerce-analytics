CREATE OR REPLACE TABLE marts.dim_sellers AS
SELECT
    seller_id,
    seller_zip_prefix,
    seller_city,
    seller_state
FROM staging.stg_sellers;