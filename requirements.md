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
    string property_type "apartment | house | room | other"
    int max_guests
    int bedrooms
    int bathrooms
    float size_m2
    decimal base_nightly_price
    string currency
    string status "active | inactive | draft"
    datetime created_at
  }

  ADDRESS {
    int address_id PK
    int property_id FK UNIQUE
    string line1
    string line2
    string city
    string state_region
    string country
    string postal_code
    float latitude
    float longitude
  }

  AMENITY {
    int amenity_id PK
    string name
    string category
  }

  PROPERTY_AMENITY {
    int property_id PK, FK
    int amenity_id PK, FK
  }

  PHOTO {
    int photo_id PK
    int property_id FK
    string url
    string caption
    boolean is_cover
    int sort_order
    datetime created_at
  }

  AVAILABILITY {
    int availability_id PK
    int property_id FK
    date available_date UNIQUE "unique with property_id"
    boolean is_available
    decimal price_override
    string currency
  }

  BOOKING {
    int booking_id PK
    int property_id FK
    int guest_id FK
    date check_in
    date check_out
    int guests_count
    string status "pending | confirmed | cancelled | completed"
    decimal total_price
    string currency
    datetime created_at
  }

  PAYMENT {
    int payment_id PK
    int booking_id FK
    decimal amount
    string currency
    string method "card | bank | wallet"
    string status "authorized | captured | refunded | failed"
    datetime paid_at
    string provider_txn_id
  }

  REVIEW {
    int review_id PK
    int booking_id FK
    int reviewer_user_id FK
    int reviewee_user_id FK
    int property_id FK
    int rating "1..5"
    string comment
    datetime created_at
  }

  CONVERSATION {
    int conversation_id PK
    int property_id FK
    datetime created_at
  }

  CONVERSATION_PARTICIPANT {
    int conversation_id PK, FK
    int user_id PK, FK
    datetime joined_at
  }

  MESSAGE {
    int message_id PK
    int conversation_id FK
    int sender_user_id FK
    string body
    datetime sent_at
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
  PROPERTY ||--|| ADDRESS : "located_at"
  PROPERTY ||--o{ PHOTO : "has"
  PROPERTY ||--o{ AVAILABILITY : "calendar"
  PROPERTY ||--o{ PROPERTY_AMENITY : "has"
  AMENITY ||--o{ PROPERTY_AMENITY : "describes"
  CONVERSATION ||--o{ MESSAGE : "contains"
  USER ||--o{ MESSAGE : "sends"
  CONVERSATION ||--o{ CONVERSATION_PARTICIPANT : "includes"
  USER ||--o{ CONVERSATION_PARTICIPANT : "participates"
