from pathlib import Path
import duckdb

DB_PATH = Path("data/duckdb/olist.duckdb")

SQL_FILES = [
    # raw
    Path("sql/00_raw/00_load_raw.sql"),

     # staging
    Path("sql/01_staging/00_create_staging_schema.sql"),
    Path("sql/01_staging/01_stg_orders.sql"),
    Path("sql/01_staging/02_stg_order_items.sql"),
    Path("sql/01_staging/03_stg_customers.sql"),
    Path("sql/01_staging/04_stg_products.sql"),
    Path("sql/01_staging/05_stg_sellers.sql"),
    Path("sql/01_staging/06_stg_payments.sql"),
    Path("sql/01_staging/07_stg_reviews.sql"),

     # validations
    Path("sql/01_staging/98_validations/01_validate_customers_pk.sql"),
    Path("sql/01_staging/98_validations/02_validate_orders_pk.sql"),
    Path("sql/01_staging/98_validations/03_validate_orders_customer_fk.sql"),
    Path("sql/01_staging/98_validations/04_validate_order_items_order_fk.sql"),
    Path("sql/01_staging/98_validations/05_validate_payments_order_fk.sql"),
    Path("sql/01_staging/98_validations/06_validate_sellers_pk.sql"),
    Path("sql/01_staging/98_validations/07_validate_order_items_seller_fk.sql"),
    Path("sql/01_staging/98_validations/08_validate_reviews_orders_fk.sql"),
    Path("sql/01_staging/98_validations/09_validate_products_pk.sql"),
    Path("sql/01_staging/98_validations/10_validate_order_items_product_fk.sql"),


    # staging check
    Path("sql/01_staging/99_check_staging.sql"),

    # marts 
    Path("sql/02_marts/00_create_marts_schema.sql"),
    Path("sql/02_marts/01_dim_customers.sql"),
    Path("sql/02_marts/02_dim_products.sql"),
    Path("sql/02_marts/03_fact_orders.sql"),
    Path("sql/02_marts/04_fact_order_items.sql"),
    Path("sql/02_marts/05_dim_sellers.sql"),

     # marts check
    Path("sql/02_marts/99_check_marts.sql"),
]

con = duckdb.connect(str(DB_PATH))
try:
    for sql_file in SQL_FILES:
        sql = sql_file.read_text(encoding="utf-8")
        is_validation = "98_validations" in str(sql_file).replace("\\", "/")
        if is_validation:
            rows = con.execute(sql).fetchall()
            if rows:
                print(f"\n❌ VALIDATION FAILED: {sql_file}")
                for r in rows[:50]:
                    print(r)
                raise RuntimeError(f"Validation failed: {sql_file}")
            else:
                print(f"✅ Validation passed: {sql_file}")
        else:
            con.execute(sql)
            print(f"✅ Ran: {sql_file}")

finally:
    con.close()
print("✅ Done.")