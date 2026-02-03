CREATE OR REPLACE VIEW staging.stg_sellers AS
SELECT
  seller_id::VARCHAR                 AS seller_id,
  seller_zip_code_prefix::VARCHAR    AS seller_zip_prefix,
  seller_city::VARCHAR               AS seller_city,
  seller_state::VARCHAR              AS seller_state
FROM raw.sellers;