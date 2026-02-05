"""
Run exploratory profiling SQL scripts against DuckDB.

Profiling is non-blocking and does NOT fail the pipeline.
"""

from pathlib import Path
import duckdb

DB_PATH = "data/duckdb/olist.duckdb"
PROFILING_DIR = Path("sql/profiling")

def run():
    con = duckdb.connect(DB_PATH)

    for sql_file in sorted(PROFILING_DIR.glob("*.sql")):
        print(f"\n--- Running {sql_file.name} ---")
        sql = sql_file.read_text()
        try:
            con.execute(sql).fetchall()
        except Exception as e:
            print(f"⚠️ Error in {sql_file.name}: {e}")

    con.close()

if __name__ == "__main__":
    run()