-- seed.sql
-- Insert sample data into the database

-- ====================
-- Users
-- ====================
INSERT INTO "User" (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'host'),
('Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', NULL, 'host'),
('Dina', 'Ali', 'dina@example.com', 'hashed_pw4', '2121112233', 'admin');

-- ====================
-- Properties
-- (linked to Bob and Charlie as hosts)
-- ====================
INSERT INTO Property (host_id, name, description, location, pricepernight)
SELECT user_id, 'Seaside Villa', 'A beautiful villa by the sea', 'Tangier, Morocco', 120.00
FROM "User" WHERE email = 'bob@example.com';

INSERT INTO Property (host_id, name, description, location, pricepernight)
SELECT user_id, 'Mountain Cabin', 'Cozy cabin in the mountains', 'Chefchaouen, Morocco', 80.00
FROM "User" WHERE email = 'charlie@example.com';

-- ====================
-- Bookings
-- (Alice books the properties)
-- ====================
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
SELECT p.property_id, u.user_id, '2025-09-01', '2025-09-05', 480.00, 'confirmed'
FROM Property p, "User" u
WHERE p.name = 'Mountain Cabin' AND u.email = 'alice@example.com';

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
SELECT p.property_id, u.user_id, '2025-10-10', '2025-10-15', 600.00, 'pending'
FROM Property p, "User" u
WHERE p.name = 'Seaside Villa' AND u.email = 'alice@example.com';

-- ====================
-- Payments
-- ====================
INSERT INTO Payment (booking_id, amount, payment_method)
SELECT booking_id, 480.00, 'credit_card'
FROM Booking WHERE total_price = 480.00;

-- ====================
-- Reviews
-- ====================
INSERT INTO Review (property_id, user_id, rating, comment)
SELECT p.property_id, u.user_id, 5, 'Amazing stay! Highly recommend.'
FROM Property p, "User" u
WHERE p.name = 'Mountain Cabin' AND u.email = 'alice@example.com';

-- ====================
-- Messages
-- ====================
INSERT INTO Message (sender_id, recipient_id, message_body)
SELECT u1.user_id, u2.user_id, 'Hi Bob, I am interested in your villa.'
FROM "User" u1, "User" u2
WHERE u1.email = 'alice@example.com' AND u2.email = 'bob@example.com';

INSERT INTO Message (sender_id, recipient_id, message_body)
SELECT u1.user_id, u2.user_id, 'Thanks Alice! Looking forward to hosting you.'
FROM "User" u1, "User" u2
WHERE u1.email = 'bob@example.com' AND u2.email = 'alice@example.com';
