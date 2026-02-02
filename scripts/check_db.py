import duckdb

DB_PATH = "data/duckdb/olist.duckdb"

con = duckdb.connect(DB_PATH)

rows = con.execute("""
    select table_schema, table_name
    from information_schema.tables
    order by 1, 2
""").fetchall()

print(rows)

con.close()