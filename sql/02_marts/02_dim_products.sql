-- sql/02_marts/02_dim_products.sql
-- Product dimension (1 row per product)

CREATE OR REPLACE TABLE marts.dim_products AS
SELECT
    product_id,
    product_category_name_pt
    product_category_name_en,
    product_name_length,
    product_description_length,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM staging.stg_products;