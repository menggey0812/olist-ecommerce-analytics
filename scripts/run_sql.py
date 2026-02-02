from pathlib import Path
import duckdb

DB_PATH = Path("data/duckdb/olist.duckdb")
SQL_PATH = Path("sql/00_raw/00_load_raw.sql")

print("Starting load...")
print("DB:", DB_PATH.resolve())
print("SQL:", SQL_PATH.resolve())

if not SQL_PATH.exists():
    raise FileNotFoundError(f"SQL file not found: {SQL_PATH}")

con = duckdb.connect(str(DB_PATH))
try:
    con.execute(SQL_PATH.read_text(encoding="utf-8"))
    print("✅ Loaded raw tables into DuckDB:", DB_PATH)
finally:
    con.close()