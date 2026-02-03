CREATE OR REPLACE VIEW staging.stg_products AS
SELECT
  p.product_id::VARCHAR                     AS product_id,
  p.product_category_name::VARCHAR          AS product_category_name_pt,
  t.product_category_name_english::VARCHAR  AS product_category_name_en,

  p.product_name_lenght::INTEGER            AS product_name_length,
  p.product_description_lenght::INTEGER     AS product_description_length,
  p.product_photos_qty::INTEGER             AS product_photos_qty,
  p.product_weight_g::INTEGER               AS product_weight_g,
  p.product_length_cm::INTEGER              AS product_length_cm,
  p.product_height_cm::INTEGER              AS product_height_cm,
  p.product_width_cm::INTEGER               AS product_width_cm
FROM raw.products p
LEFT JOIN raw.product_category_translation t
  ON p.product_category_name = t.product_category_name;