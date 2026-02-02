# Phase 1 — Environment Setup (Python + venv + DuckDB)

All commands are run from the project root directory.

## 1) Python (Windows)
Python installed: 3.12.10 (Windows)

Check installed versions:
- py -0

Use Python 3.12 explicitly:
- py -3.12 --version

## 2) Create + activate venv
Create venv using Python 3.12:
- py -3.12 -m venv .venv

Activate:
- .\.venv\Scripts\Activate.ps1

PowerShell note (only if activation is blocked):
- Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Verify venv Python:
- python --version
- python -c "import sys; print(sys.executable); print(sys.version)"

## 3) Install dependencies
Upgrade pip:
- python -m pip install --upgrade pip

Install deps (from requirements.txt):
- pip install -r requirements.txt

(If requirements.txt not created yet)
- pip freeze > requirements.txt

Verify DuckDB import:
- python -c "import duckdb; print(duckdb.__version__)"

## 4) Data + DuckDB files (important)
Raw CSVs location (NOT committed to Git):
- data_raw/

DuckDB database location (NOT committed to Git):
- data/duckdb/olist.duckdb

⚠️ Do NOT manually create olist.duckdb in VS Code.
Let DuckDB create it when you run the load script.

## 5) Load raw tables into DuckDB
Run the SQL loader:
- python scripts/run_sql.py

## 6) Verify tables
List tables from DuckDB:
- python scripts/check_db.py