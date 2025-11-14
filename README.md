# Job_Postings_Facts

Overview
--------
This repository contains SQL DDL, CSV sample data, and analytic query files for the "Job_Postings_Facts" dataset. The scripts are written for PostgreSQL (ANSI-safe SQL) and are idempotent where possible.

Contents
--------
- `databases/all_folders/sql_load/1_create_database.sql` - Database creation script (note: may require manual adjustments for your environment).
- `databases/all_folders/sql_load/2_create_tables.sql` - Idempotent CREATE TABLE statements for `company_dim`, `skills_dim`, `job_postings_fact`, and `skills_job_dim`.
- `databases/all_folders/sql_load/3_modify_tables.sql` - CSV load instructions (uses client-side `\copy` recommended for local psql runs).
- `databases/all_folders/csv_files/` - CSV source files used to populate the schema (company_dim.csv, job_postings_fact.csv, skills_dim.csv, skills_job_dim.csv).
- `Project/` - Analysis queries (named like `top_paying_jobs_q1.sql`, `skills_for_top_jobs_q2.sql`, etc.). Each query file includes an Analysis Brief and sample JSON output stored as SQL block comments so files remain runnable.

Quick start (PostgreSQL + psql)
-------------------------------
1. Create the database (run from a superuser or an account with CREATE DATABASE privileges):

   psql -c "CREATE DATABASE sql_course;"

2. Run the DDL to create tables (from repository root):

   psql -d sql_course -f databases/all_folders/sql_load/2_create_tables.sql

3. Load CSVs using psql's client-side `\copy` (run from the repository root so paths resolve):

   # Example: load company_dim
   psql -d sql_course -c "\copy company_dim FROM 'databases/all_folders/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');"

   # Repeat for skills_dim, skills_job_dim, and job_postings_fact

Notes on COPY vs \copy
----------------------
- `COPY` runs on the PostgreSQL server and requires the server process to have direct file access. This often causes permission errors when the CSVs are on your local filesystem and the server runs elsewhere.
- `\copy` is a psql client command that streams the file from your client into the server. It works when you run psql locally and is the recommended method for these repository scripts.

Running queries and exporting JSON
----------------------------------
- The `Project/` queries are selectable SQL files. To run a single query and get JSON output from psql:

   psql -d sql_course -f Project/top_paying_jobs_q1.sql -t -A -F"," --no-align

  To produce a JSON array of rows directly from a SELECT, use:

   psql -d sql_course -c "SELECT json_agg(row_to_json(t)) FROM ( <your select here> ) t;"

Repository conventions and tips
------------------------------
- DDL scripts use `IF NOT EXISTS` for idempotency so you can re-run them during development.
- Sample outputs are kept as SQL block comments inside query files to keep the files runnable while preserving example results.
- Large CSVs (e.g., `job_postings_fact.csv`) may be slow to import. Consider loading a subset when iterating locally.

Troubleshooting
---------------
- If you hit a permission error with `COPY`: switch to `\copy` as shown above.
- If a table already exists and you want to recreate it, drop it manually before running the DDL:

   psql -d sql_course -c "DROP TABLE IF EXISTS job_postings_fact CASCADE;"

- For encoding issues, set client encoding in psql before `\copy`ing:

   psql -d sql_course -c "SET client_encoding = 'UTF8';"

Next steps (suggested)
----------------------
- Add a small sample dataset or a filtered subset of `job_postings_fact.csv` for faster local testing.
- Add a `Makefile` or `task` scripts to automate database creation, loading, and running all Project queries.

License
-------
This repository contains example data and code for learning and analysis. No license file is included—add one if you plan to publish.
