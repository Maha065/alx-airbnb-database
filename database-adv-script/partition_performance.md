# Partitioning Performance Report

## 1. Objective
The `Booking` table can become very large in real-world systems.  
To optimize queries, we implemented **partitioning by start_date**.

---

## 2. Implementation
- The `Booking` table is partitioned by year (`2023`, `2024`, `2025`).
- A default partition captures rows outside defined ranges.
- Indexes were added to each partition on `user_id` for faster joins and filters.

---

## 3. Performance Testing
We ran:

```sql
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';

---

## ✅ Step 3: Commit & Push

From repo root:

```bash
git add database-adv-script/partitioning.sql database-adv-script/partition_performance.md
git commit -m "Implemented Booking table partitioning and performance report"
git push origin main
