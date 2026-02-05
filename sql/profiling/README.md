# Exploratory Data Profiling

This folder contains **exploratory data profiling queries** used to understand the structure, coverage, and basic quality characteristics of the Olist dataset.

These queries are **not intended to be exhaustive data quality tests**, nor do they gate the pipeline. Instead, they serve as lightweight, analyst-style checks that typically occur alongside staging and early validation work.

---

## Purpose

The profiling queries focus on:

- High-level row counts across raw, staging, and marts layers
- Null and duplicate spot-checks on key fields
- Basic domain distributions (e.g. categorical values)
- Date range coverage and obvious temporal anomalies
- Simple text cleanliness checks

They are designed to answer questions such as:

- *Do record volumes look reasonable after each transformation?*
- *Are there unexpected nulls or duplicates in key identifiers?*
- *Do date ranges align with business expectations?*
- *Are categorical fields populated as expected?*

---

## Why This Is Exploratory

The Olist dataset is known to be **relatively clean and well-structured**, which means:

- Many checks return “no issues”
- Edge cases are limited
- Complex data quality failures are rare

As a result, the profiling implemented here is intentionally **lightweight**.

In a real business environment, where data often comes from:
- Multiple operational systems
- Manual inputs
- Inconsistent schemas
- Partial historical backfills

this profiling layer would typically be **expanded significantly** to include:

- More granular anomaly detection
- Distribution drift checks
- Cross-table reconciliation
- Business-rule-specific validations

---

## Execution

All profiling queries can be executed via:

```bash
python scripts/run_profiling.py