-- aggregations_and_window_functions.sql
-- Aggregation queries and window functions

-- ===========================
-- 1. Aggregation with GROUP BY
-- Find the total number of bookings made by each user
-- ===========================
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- ===========================
-- 2. Window Function with RANK()
-- Rank properties based on the total number of bookings
-- ===========================
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY property_rank ASC;

-- ===========================
-- 3. Window Function with ROW_NUMBER()
-- Assign a unique row number to properties ordered by bookings
-- ===========================
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS booking_count,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number_position
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY row_number_position ASC;

