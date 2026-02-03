-- sql/01_staging/07_stg_reviews.sql
-- Create staging view for reviews

CREATE OR REPLACE VIEW staging.stg_reviews AS
SELECT
    review_id,
    order_id,
    review_score::INTEGER                                  AS review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date::TIMESTAMP                        AS review_creation_ts,
    review_answer_timestamp::TIMESTAMP                      AS review_answer_ts
FROM raw.order_reviews;