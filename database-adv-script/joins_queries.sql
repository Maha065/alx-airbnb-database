-- joins_queries.sql
-- Complex SQL queries with different types of joins

-- ===========================
-- 1. INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings
-- ===========================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id
ORDER BY b.start_date ASC;

-- ===========================
-- 2. LEFT JOIN
-- Retrieve all properties and their reviews, including properties with no reviews
-- ===========================
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.name ASC, r.created_at DESC;

-- ===========================
-- 3. FULL OUTER JOIN
-- Retrieve all users and all bookings, even if a user has no booking 
-- or a booking is not linked to a
 ON u.user_id = b.user_id;
