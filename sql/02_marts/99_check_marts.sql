-- sql/02_marts/99_check_marts.sql
-- Verify marts tables exist

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'marts'
ORDER BY table_name;