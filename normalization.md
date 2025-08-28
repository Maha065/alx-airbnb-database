# Database Normalization (to 3NF)

## Objective
Ensure the Airbnb-like database schema is normalized up to Third Normal Form (3NF).

---

## 1. First Normal Form (1NF)
- All attributes contain **atomic values** (no repeating groups).
- Each table has a **primary key**.
- No multivalued fields (e.g., no array of emails or phone numbers).

✅ Our schema satisfies 1NF.

---

## 2. Second Normal Form (2NF)
- The schema is already in 1NF.
- No partial dependencies because every table’s primary key is a **single column (UUID)**.
- All non-key attributes depend on the entire primary key.

✅ Our schema satisfies 2NF.

---

## 3. Third Normal Form (3NF)
- The schema is already in 2NF.
- We must check for **transitive dependencies**.

### User
- All attributes depend only on `user_id`.  
- No transitive dependencies. ✅

### Property
- All attributes depend on `property_id`.  
- `host_id` is a foreign key to User, which is valid.  
- Potential improvement: Split `location` into an `Address` table if more detail is needed.  

### Booking
- All attributes depend on `booking_id`.  
- `total_price` can be derived from `(end_date - start_date) * pricepernight`.  
- Keeping it introduces **redundancy**, but is often used for performance reasons.  

### Payment
- All attributes depend only on `payment_id`. ✅

### Review
- All attributes depend only on `review_id`. ✅

### Message
- All attributes depend only on `message_id`. ✅

---

## Final Notes
- The schema is in **3NF**.  
- Optional refinements for strict 3NF:
  - Remove `total_price` from Booking (calculate dynamically).  
  - Normalize `location` into a separate `Address` table.

---
