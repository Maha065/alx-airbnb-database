# Database Seeding

This folder contains SQL scripts to populate the **Airbnb-like database** with sample data.

## Files
- `seed.sql` → Inserts sample rows for all entities.

## Sample Data
- **Users**: Guest, hosts, and an admin.
- **Properties**: Villa and cabin owned by hosts.
- **Bookings**: Guest booking the properties.
- **Payments**: Linked to confirmed bookings.
- **Reviews**: Guest review of a property.
- **Messages**: Communication between guest and host.

## Usage
Run the following command to seed the database:

```bash
psql -U <username> -d <database_name> -f seed.sql
