# Entity Relationship Diagram (ERD)

```mermaid
erDiagram

  USER {
    UUID user_id PK
    string first_name
    string last_name
    string email UNIQUE
    string password_hash
    string phone_number
    enum role
    timestamp created_at
  }

  PROPERTY {
    UUID property_id PK
    UUID host_id FK
    string name
    text description
    string location
    decimal pricepernight
    timestamp created_at
    timestamp updated_at
  }

  BOOKING {
    UUID booking_id PK
    UUID property_id FK
    UUID user_id FK
    date start_date
    date end_date
    decimal total_price
    enum status
    timestamp created_at
  }

  PAYMENT {
    UUID payment_id PK
    UUID booking_id FK
    decimal amount
    timestamp payment_date
    enum payment_method
  }

  REVIEW {
    UUID review_id P_
