from pathlib import Path
import duckdb

DB_PATH = Path("data/duckdb/olist.duckdb")

SQL_FILES = [
    Path("sql/00_raw/00_load_raw.sql"),
    Path("sql/01_staging/00_create_staging_schema.sql"),
    Path("sql/01_staging/01_stg_orders.sql"),
    Path("sql/01_staging/02_stg_order_items.sql"),
    Path("sql/01_staging/03_stg_customers.sql"),
    Path("sql/01_staging/04_stg_products.sql"),
    Path("sql/01_staging/05_stg_sellers.sql"),
    Path("sql/01_staging/06_stg_payments.sql"),
    Path("sql/01_staging/07_stg_reviews.sql"),
    Path("sql/01_staging/99_check_staging.sql"),
]

con = duckdb.connect(str(DB_PATH))
try:
    for sql_file in SQL_FILES:
        sql = sql_file.read_text(encoding="utf-8")
        con.execute(sql)
        print(f"✅ Ran: {sql_file}")
finally:
    con.close()
print("✅ Done.")