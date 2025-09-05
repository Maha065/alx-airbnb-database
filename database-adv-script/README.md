# Advanced SQL Queries - Joins

This folder contains SQL queries demonstrating different types of joins on the **Airbnb-like database**.

## Files
- `joins_queries.sql` → Contains INNER JOIN, LEFT JOIN, and FULL OUTER JOIN queries.

## Queries
1. **INNER JOIN**: Retrieve all bookings with the user details who made them.
2. **LEFT JOIN**: Retrieve all properties with their reviews (including properties without reviews).
3. **FULL OUTER JOIN**: Retrieve all users and all bookings, even if there is no match.

## Usage
Run the queries inside PostgreSQL:

```bash
psql -U <username> -d <database_name> -f joins_queries.sql

---

## ✅ Step 4: Commit & Push

From your repo root:

```bash
git add database-adv-script/joins_queries.sql database-adv-script/README.md
git commit -m "Added advanced join queries (INNER, LEFT, FULL OUTER)"
git push origin main
