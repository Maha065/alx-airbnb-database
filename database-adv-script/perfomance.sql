-- perfomance.sql
-- Initial and optimized queries with EXPLAIN for performance analysis

-- ===========================
-- 1. Initial Query (Complex Joins)
-- Retrieves all bookings with user, property, and payment details
-- ===========================
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.created_at DESC;

-- ===========================
-- 2. Refactored Query (Optimized)
-- Use only required columns, leverage indexes, avoid unnecessary joins
-- ===========================
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name || ' ' || u.last_name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;
