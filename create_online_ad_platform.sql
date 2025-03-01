CREATE TABLE Roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role_id INT REFERENCES Roles(role_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_category_id INT REFERENCES Categories(category_id) ON DELETE SET NULL
);

CREATE TABLE Listing_Status (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

CREATE TABLE Locations (
    location_id SERIAL PRIMARY KEY,
    city_id INT,
    district VARCHAR(100) NOT NULL
);

CREATE TABLE Cities (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

ALTER TABLE Locations ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES Cities(city_id) ON DELETE SET NULL;

CREATE TABLE Listings (
    listing_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category_id INT REFERENCES Categories(category_id) ON DELETE SET NULL,
    location_id INT REFERENCES Locations(location_id) ON DELETE SET NULL,
    status_id INT REFERENCES Listing_Status(status_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Attributes (
    attribute_id SERIAL PRIMARY KEY,
    category_id INT REFERENCES Categories(category_id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Listing_Attributes (
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    attribute_id INT REFERENCES Attributes(attribute_id) ON DELETE CASCADE,
    value VARCHAR(255) NOT NULL,
    PRIMARY KEY (listing_id, attribute_id)
);

CREATE TABLE Images (
    image_id SERIAL PRIMARY KEY,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    image_url TEXT NOT NULL
);

CREATE TABLE Videos (
    video_id SERIAL PRIMARY KEY,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    video_url TEXT NOT NULL
);

CREATE TABLE Files (
    file_id SERIAL PRIMARY KEY,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    file_url TEXT NOT NULL
);

CREATE TABLE Messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    receiver_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    reviewer_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    reviewed_user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Favorites (
    favorite_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE
);

CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Promotions (
    promo_id SERIAL PRIMARY KEY,
    listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL,
    duration INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Logs (
    log_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE SET NULL,
    action VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45)
);

CREATE TABLE Reports (
    report_id SERIAL PRIMARY KEY,
    reported_listing_id INT REFERENCES Listings(listing_id) ON DELETE CASCADE,
    reported_by_user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    reason TEXT NOT NULL,
    report_status VARCHAR(50) NOT NULL,
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
