-- sql/01_staging/06_stg_payments.sql
-- Create staging view for payments

CREATE OR REPLACE VIEW staging.stg_payments AS
SELECT
    order_id,
    payment_sequential::INTEGER            AS payment_sequential,
    payment_type,
    payment_installments::INTEGER          AS payment_installments,
    payment_value::DOUBLE                  AS payment_value
FROM raw.order_payments;