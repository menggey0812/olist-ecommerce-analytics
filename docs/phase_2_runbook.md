# Phase 2 — Data Modeling Pipeline (Raw → Staging)

## Purpose

Phase 2 builds a **reproducible, SQL-based data modeling pipeline** on top of DuckDB.

This phase mirrors real-world **analytics engineering workflows**, where:
- raw data ingestion
- transformations
- orchestration
- and verification  
are clearly separated and repeatable.

---

## Goals

By the end of Phase 2, you will have:

- Raw CSVs loaded into DuckDB (`raw` schema)
- Clean, analytics-ready **staging views** (`staging` schema)
- A single command to run the full pipeline
- A verification step to confirm outputs exist

All steps are **idempotent** (safe to re-run).

---

## Prerequisites

Before running Phase 2, ensure:

- Phase 1 completed successfully
- Python 3.12 virtual environment exists
- DuckDB database exists at: `data/duckdb/olist.duckdb`
- Raw CSV files exist under `data_raw/`

Activate environment:
```bash
.\.venv\Scripts\Activate.ps1