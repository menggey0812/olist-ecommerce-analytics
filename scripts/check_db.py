import duckdb

DB_PATH = "data/duckdb/olist.duckdb"

con = duckdb.connect(DB_PATH)

rows = con.execute("""
    select table_schema, table_name
    from information_schema.views
    WHERE table_schema = 'staging'
    order by table_name
""").fetchall()

print("Staging views:")
for row in rows:
    print(row)

con.close()