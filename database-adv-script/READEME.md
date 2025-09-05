# Aggregations and Window Functions

This folder contains SQL queries demonstrating the use of **aggregations** and **window functions** on the Airbnb-like database.

## Files
- `aggregations_and_window_functions.sql`

## Queries
1. **Aggregation with GROUP BY**
   - Finds the total number of bookings made by each user.
   - Uses `COUNT` and `GROUP BY`.

2. **Window Function (RANK)**
   - Ranks properties by the number of bookings received.
   - Uses `RANK()` with `OVER` and `ORDER BY`.

## Usage
Run inside PostgreSQL:

```bash
psql -U <username> -d <database_name> -f aggregations_and_window_functions.sql

---

## ✅ Step 4: Commit & Push

From repo root:

```bash
git add database-adv-script/aggregations_and_window_functions.sql database-adv-script/README.md
git commit -m "Added aggregation and window function queries"
git push origin main
