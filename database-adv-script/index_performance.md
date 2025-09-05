# Index Performance Analysis

This document explains the indexes created and their impact on query performance.

## 1. Created Indexes
- **User**
  - `idx_user_email` → Speeds up lookups by email (unique constraint).
  - `idx_user_role` → Improves filtering when selecting all hosts/guests/admins.

- **Property**
  - `idx_property_host_id` → Optimizes joins between `User` and `Property`.
  - `idx_property_location` → Improves searches when filtering by location.

- **Booking**
  - `idx_booking_user_id` → Optimizes joins between `User` and `Booking`.
  - `idx_booking_property_id` → Optimizes joins between `Property` and `Booking`.
  - `idx_booking_status` → Speeds up filtering by booking status.
  - `idx_booking_user_property` (composite) → Helps queries filtering on both `user_id` and `property_id`.

## 2. Performance Measurement
We used PostgreSQL `EXPLAIN` and `ANALYZE` to compare queries before and after indexes.

### Example Query (before indexing)
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000'
  AND property_id = '987e6543-e21b-45c6-b567-426614174999';

---

## ✅ Step 3: Commit & Push

From repo root:

```bash
git add database-adv-script/database_index.sql database-adv-script/index_performance.md
git commit -m "Added indexes and performance analysis"
git push origin main
