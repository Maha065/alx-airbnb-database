# ER Diagram – Rental Platform

```mermaid
erDiagram

  USER {
    int user_id PK
    string full_name
    string email UNIQUE
    string phone
    string role "host | guest | both"
    datetime created_at
  }

  PROPERTY {
    int property_id PK
    int host_id FK
    string title
    string description
    string property_type
    int max_guests
    decimal base_nightly_price
    string currency
    datetime created_at
  }

  BOOKING {
    int booking_id PK
    int property_id FK
    int guest_id FK
    date check_in
    date check_out
    decimal total_price
    string status
  }

  PAYMENT {
    int payment_id PK
    int booking_id FK
    decimal amount
    string method
    string status
  }

  REVIEW {
    int review_id PK
    int booking_id FK
    int reviewer_user_id FK
    int reviewee_user_id FK
    int property_id FK
    int rating
    string comment
  }

  %% Relationships
  USER ||--o{ PROPERTY : "hosts"
  USER ||--o{ BOOKING : "makes"
  PROPERTY ||--o{ BOOKING : "is booked"
  BOOKING ||--o{ PAYMENT : "has"
  USER ||--o{ REVIEW : "writes"
  USER ||--o{ REVIEW : "receives"
  BOOKING ||--o{ REVIEW : "about"
  PROPERTY ||--o{ REVIEW : "about_property"

