# Phase 1 – Environment Setup (Python + venv + DuckDB)
All commands are run from the project root directory.
	•	Python installed: 3.12.10 (Windows)
	•	Create venv using 3.12:
	•	py -3.12 -m venv .venv
	•	Activate:
	•	.\.venv\Scripts\Activate.ps1
	•	Install deps:
	•	pip install -r requirements.txt
	•	Verify:
	•	python --version
	•	python -c "import duckdb; print(duckdb.__version__)"
