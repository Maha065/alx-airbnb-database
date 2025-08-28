# ERD Requirements

## Objective
Create an Entity-Relationship (ER) diagram based on the database specification.

---

## Entities and Attributes

### User
- user_id (PK)
- first_name
- last_name
- email (unique)
- password_hash
- phone_number
- role (guest, host, admin)
- created_at

### Property
- property_id (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### Booking
- booking_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status (pending, confirmed, canceled)
- created_at

### Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method (credit_card, paypal, stripe)

### Review
- review_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (1-5)
- comment
- created_at

### Message
- message_id (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at

---

## Relationships
- User (host) 1 ──▶ N Property
- User (guest) 1 ──▶ N Booking
- Property 1 ──▶ N Booking
- Booking 1 ──▶ N Payment
- Property 1 ──▶ N Review
- User 1 ──▶ N Review
- User 1 ──▶ N Message (sender)
- User 1 ──▶ N Message (recipient)

---

## ER Diagram
Use **Draw.io** (or another ERD tool) to visually represent the schema.  
Save/export the diagram as `ERD.drawio` or `ERD.png` in this folder.


