-- Text cleanliness spot checks (non-exhaustive)
-- Profiling only, not validation

-- 1) Leading / trailing whitespace in category names (PT)
SELECT COUNT(*) AS whitespace_category_pt
FROM staging.stg_products
WHERE product_category_name_pt IS NOT NULL
  AND product_category_name_pt != TRIM(product_category_name_pt);

-- 2) Case inconsistencies in category names (PT)
SELECT
  LOWER(product_category_name_pt) AS normalized_name,
  COUNT(DISTINCT product_category_name_pt) AS variants
FROM staging.stg_products
WHERE product_category_name_pt IS NOT NULL
GROUP BY 1
HAVING COUNT(DISTINCT product_category_name_pt) > 1
ORDER BY variants DESC
LIMIT 20;

-- 3) Optional: English translation cleanliness
SELECT COUNT(*) AS whitespace_category_en
FROM staging.stg_products
WHERE product_category_name_en IS NOT NULL
  AND product_category_name_en != TRIM(product_category_name_en);