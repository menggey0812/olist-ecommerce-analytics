# Phase 2 — Data Modeling Pipeline (Raw → Staging → Validation → Marts)

## Purpose

Phase 2 builds a **reproducible, SQL-based data modeling pipeline** on top of DuckDB.

This phase mirrors real-world **analytics engineering workflows**, where:
- raw data ingestion
- type casting & light standardisation
- data quality validation
- analytics-ready modeling 
are explicit and repeatable.

---

## Goals

By the end of Phase 2, you will have:

- Raw CSVs loaded into DuckDB (`raw` schema)
- Clean, typed staging views (`staging` schema)
- Explicit data validation checks (PK/FK/nulls)
- Final analytics tables in a star-schema style (`marts` schema)
- A single command to run the entire pipeline end-to-end

All steps are **idempotent** (safe to re-run).

---

## Prerequisites

Before running Phase 2, ensure:

- Phase 1 completed successfully
- Python 3.12 virtual environment exists
- DuckDB database exists at: `data/duckdb/olist.duckdb`
- Raw CSV files exist under `data_raw/`

---

## Pipeline Flow

The pipeline runs in the following fixed order:

- Raw load: load CSVs into raw schema
- Staging views: cast types & lightly standardise
- Validations: check data quality & integrity
- Marts: build final analytics tables

 This order is enforced by:
 - scripts/run_sql.py

 ---

## How to Run Phase 2

From the repository root:
- .\.venv\Scripts\Activate.ps1 
python scripts/run_sql.py

If the run finishes without errors, Phase 2 has completed successfully.

 ---

## What Gets Created

### Schemas

- raw: tables loaded directly from CSV
- staging: views with clean names, correct types
- marts: final analytics tables

### Staging Views (staging schema)

Created in sql/01_staging/:

- staging.stg_customers
- staging.stg_orders
- staging.stg_order_items
- staging.stg_products
- staging.stg_sellers
- staging.stg_payments
- staging.stg_reviews

Purpose of staging:

- cast strings → timestamps / numbers
- standardise column names
- apply light transformations only
- no heavy business logic

Staging is implemented as views to keep transformations declarative and avoid duplicating storage.

### Validation Checks (sql/01_staging/98_validations/)

Validation queries return rows only when problems exist.

Checks implemented:

- customer primary key uniqueness
- order primary key uniqueness
- orders → customers foreign key
- order_items → orders foreign key
- payments → orders foreign key

If any validation returns rows, the pipeline fails.

### Mart Tables (marts schema)
Created in sql/02_marts/:

Dimensions
- marts.dim_customers (1 row per customer)
- marts.dim_products  (1 row per product)

Facts
- marts.fact_orders (1 row per order)
- marts.fact_order_items (1 row per order line)

Purpose of marts:

- analytics-ready tables
- stable schemas for BI tools
- joins & aggregations already resolved

---

## Verification

### Automatic

All calidations must pass

- 99_check_staging.sql confirms staging views exist
- 99_check_marts.sql confirms marts tables exist

### Manual 
- python scripts/check_db.py
This lists schemas, tables, and views for sanity checking.

---

## Notes on Data Cleanliness

The Olist dataset is relatively clean, but Phase 2 intentionally includes:

- explicit typing
- integrity checks
- controlled transformations

This demonstrates real-world pipeline awareness, even when the source data is clean.

⚠️ In Phase 5, we will explicitly document: Data realism & assumptions - What was clean, what was assumed, and how this would scale to messy production data.