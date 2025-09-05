-- partitioning.sql
-- Partitioning the Booking table by start_date for performance optimization

-- ===========================
-- 1. Drop existing Booking if needed
-- (CAUTION: This will remove old data, normally you’d migrate instead)
-- ===========================
DROP TABLE IF EXISTS Booking CASCADE;

-- ===========================
-- 2. Create Partitioned Booking Table
-- ===========================
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- ===========================
-- 3. Create Partitions by Year
-- ===========================
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Default partition to catch rows outside defined ranges
CREATE TABLE Booking_default PARTITION OF Booking DEFAULT;

-- ===========================
-- 4. Indexes on Partitions
-- ===========================
CREATE INDEX idx_booking_2023_user_id ON Booking_2023(user_id);
CREATE INDEX idx_booking_2024_user_id ON Booking_2024(user_id);
CREATE INDEX idx_booking_2025_user_id ON Booking_2025(user_id);

-- ===========================
-- 5. Test Query with EXPLAIN ANALYZE
-- ===========================
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
