# Query Optimization Report

## 1. Initial Query
The initial query retrieved:
- All booking details
- All user details
- All property details
- All payment details

### Issues
- Selected **too many columns** (including unused attributes).
- Used `ORDER BY b.created_at`, which forced sorting without a proper index.
- Resulted in **nested loop joins** in PostgreSQL `EXPLAIN ANALYZE`.

---

## 2. Refactored Query
Changes applied:
- Selected only the **needed fields** (`user_name`, `property_name`, `amount`, `payment_method`).
- Changed `ORDER BY` to `b.start_date`, which is more relevant for bookings.
- Leveraged indexes:
  - `idx_booking_user_id`
  - `idx_booking_property_id`
  - `idx_booking_status`
  - `idx_booking_user_property`

### Benefits
- Query plan switched from **Seq Scan** to **Index Scan**.
- Reduced the amount of data retrieved and sorted.
- Faster execution (tested with `EXPLAIN ANALYZE`).

---

## 3. Example of EXPLAIN Differences

### Before (Initial Query)
git add database-adv-script/perfomance.sql database-adv-script/optimization_report.md
git commit -m "Added performance optimization query and report"
git push origin main
