
-- database_index.sql
-- Indexes to improve query performance and queries to measure impact

-- ===========================
-- User table indexes
-- ===========================

-- Index on email since it is used often in lookups and must be unique
CREATE UNIQUE INDEX idx_user_email ON "User"(email);

-- Index on role to quickly filter users by role (guest, host, admin)
CREATE INDEX idx_user_role ON "User"(role);

-- ===========================
-- Property table indexes
-- ===========================

-- Index on host_id for joins between User and Property
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on location to optimize searches by location
CREATE INDEX idx_property_location ON Property(location);

-- ===========================
-- Booking table indexes
-- ===========================

-- Index on user_id for joins between User and Booking
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id for joins between Property and Booking
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on status for queries filtering bookings (pending, confirmed, canceled)
CREATE INDEX idx_booking_status ON Booking(status);

-- Composite Index Example
-- Optimize frequent queries filtering by user_id and property_id
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

-- ===========================
-- Performance Testing with EXPLAIN ANALYZE
-- ===========================

-- Check performance of User email lookup
EXPLAIN ANALYZE
SELECT * FROM "User"
WHERE email = 'test@example.com';

-- Check performance of Property location search
EXPLAIN ANALYZE
SELECT * FROM Property
WHERE location = 'Tangier';

-- Check performance of Booking filtering by user_id and property_id
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000'
  AND property_id = '987e6543-e21b-45c6-b567-426614174999';
