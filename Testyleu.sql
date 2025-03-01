-- Пайдаланушыны тестілеу
SET ROLE seller_user;
SELECT * FROM attributes;


-- JOIN сұранысы
SET ROLE admin_user;
SELECT u.name, u.email, l.title, c.name AS category, loc.city_id
FROM Users u
JOIN Listings l ON u.user_id = l.user_id
JOIN Categories c ON l.category_id = c.category_id
JOIN Locations loc ON l.location_id = loc.location_id;



-- GROUP BY және HAVING
SELECT reviewed_user_id, AVG(rating) AS avg_rating, COUNT(*) AS total_reviews
FROM Reviews
GROUP BY reviewed_user_id
HAVING AVG(rating) > 4.0;


-- Индекстерді тексеру
EXPLAIN ANALYZE 
SELECT * FROM Users WHERE email = 'test@example.com';

CREATE INDEX idx_users_email ON Users(email);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE 
SELECT * FROM Users WHERE email = 'test@example.com';



-- Агрегаттық функциялар
SELECT category_id, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price, COUNT(*) AS total_listings
FROM Listings
GROUP BY category_id;



-- WHERE фильтрациясы
SELECT u.user_id, u.name, COUNT(m.message_id) AS total_messages
FROM Users u
LEFT JOIN Messages m ON u.user_id = m.receiver_id
GROUP BY u.user_id, u.name
HAVING COUNT(m.message_id) < 3;
