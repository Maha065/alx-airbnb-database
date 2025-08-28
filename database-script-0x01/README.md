# Database Schema (DDL)

This folder contains the SQL script to create the database schema for the **Airbnb-like platform**.

## Files
- `schema.sql` → SQL script to create all tables, constraints, and indexes.

## Schema Details
- **User**: Stores user details (guest, host, admin).
- **Property**: Stores property details, linked to a host.
- **Booking**: Stores booking information (user → property).
- **Payment**: Stores payments linked to bookings.
- **Review**: Stores user reviews for properties.
- **Message**: Stores messages exchanged between users.

## Constraints & Indexes
- Primary Keys: UUIDs for global uniqueness.
- Foreign Keys: Maintain relationships between entities.
- Constraints: Ensure valid values (e.g., role, status, rating).
- Indexes: Added to email, foreign keys for performance.

## Usage
To run the schema:

```bash
psql -U <username> -d <database_name> -f schema.sql
