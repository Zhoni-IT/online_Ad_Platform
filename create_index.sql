CREATE UNIQUE INDEX idx_users_email ON Users(email);
CREATE UNIQUE INDEX idx_users_phone ON Users(phone);


CREATE INDEX idx_listings_user ON Listings(user_id);
CREATE INDEX idx_listings_category ON Listings(category_id);
CREATE INDEX idx_listings_location ON Listings(location_id);
CREATE INDEX idx_reviews_reviewer ON Reviews(reviewer_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE SELECT * FROM Users WHERE email = 'medet@example.com';