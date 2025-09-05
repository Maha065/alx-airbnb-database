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

-- Index on property_id for joins between Property and Boo_
ooking_user_property ON Booking(user_id, property_id);
