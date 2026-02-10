from pathlib import Path
import duckdb

DB_PATH = Path("data/duckdb/olist.duckdb")
OUT_DIR = Path("data/exports/marts")

TABLES = [
    "dim_customers",
    "dim_products",
    "dim_sellers",
    "fact_orders",
    "fact_order_items",
]

def main() -> None:
    if not DB_PATH.exists():
        raise FileNotFoundError(f"DuckDB database not found: {DB_PATH}")

    OUT_DIR.mkdir(parents=True, exist_ok=True)

    con = duckdb.connect(str(DB_PATH))

    for t in TABLES:
        out_file = OUT_DIR / f"{t}.parquet"
        con.execute(f"""
            COPY marts.{t}
            TO '{out_file.as_posix()}'
            (FORMAT PARQUET);
        """)
        print(f"Exported: {out_file}")

    con.close()
    print("✅ Parquet export complete.")

if __name__ == "__main__":
    main()