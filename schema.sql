# Go inside your repo
cd alx-airbnb-database

# Create required directories
mkdir -p ERD
mkdir -p database-script-0x01

# ========================
# ERD Requirements
# ========================
cat > ERD/requirements.md << 'EOF'
# ERD Requirements

## Objective
Create an Entity-Relationship (ER) diagram based on the database specification.

## Entities
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

## Relationships
- User ↔ Booking
- User ↔ Property
- User ↔ Review
- User ↔ Message
- Property ↔ Booking
- Property ↔ Review
- Booking ↔ Payment

## Instructions
1. Identify entities and attributes.
2. Define relationships between them.
3. Use a tool like Draw.io to create the ER diagram.
EOF

# ========================
# Normalization File
# ========================
cat > normalization.md << 'EOF'
# Normalization Steps

## Objective
Apply normalization principles to ensure the database is in the third normal form (3NF).

## 1NF
- All attributes hold atomic values.
- No repeating groups.
- Example: User phone number is a single attribute, not multiple columns.

## 2NF
- All non-key attributes depend fully on the primary key.
- Example: In Booking, total_price depends on (booking_id), not partially on property_id.

## 3NF
- No transitive dependencies.
- Example: Payment method details are stored only in Payment, not repeated in Booking.

## Result
The schema now avoids redundancy, ensures consistency, and satisfies 3NF.
EOF

# ========================
# Schema.sql File
# ========================
cat > database-script-0x01/schema.sql << 'EOF'
-- schema.sql
-- Airbnb-like database schema

DROP TABLE IF EXISTS Message CASCADE;
DROP TABLE IF EXISTS Review CASCADE;
DROP TABLE IF EXISTS Payment CASCADE;
DROP TABLE IF EXISTS Booking CASCADE;
DROP TABLE IF EXISTS Property CASCADE;
DROP TABLE IF EXISTS "User" CASCADE;

-- ===============================
-- User Table
-- ===============================
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON "User"(email);

-- ===============================
-- Property Table
-- ===============================
CREATE TABLE Property (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES_



