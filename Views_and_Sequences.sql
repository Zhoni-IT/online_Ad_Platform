-- View для активных объявлений (Listings)
CREATE VIEW active_listings AS
SELECT 
    l.listing_id, 
    l.title, 
    l.price, 
    u.name AS seller_name, 
    c.name AS category_name, 
    s.status_name
FROM Listings l
JOIN Users u ON l.user_id = u.user_id
JOIN Categories c ON l.category_id = c.category_id
JOIN Listing_Status s ON l.status_id = s.status_id
WHERE s.status_name = 'Белсенді';



-- View для списка пользователей и их объявлений
CREATE VIEW user_listings AS
SELECT 
    u.user_id, 
    u.name, 
    u.email, 
    COUNT(l.listing_id) AS total_listings
FROM Users u
LEFT JOIN Listings l ON u.user_id = l.user_id
GROUP BY u.user_id, u.name, u.email;



-- View для лучших продавцов (по отзывам)
CREATE VIEW top_sellers AS
SELECT 
    u.user_id, 
    u.name, 
    ROUND(AVG(r.rating), 2) AS avg_rating, 
    COUNT(r.review_id) AS total_reviews
FROM Users u
JOIN Reviews r ON u.user_id = r.reviewed_user_id
GROUP BY u.user_id, u.name
HAVING COUNT(r.review_id) = 1
ORDER BY avg_rating DESC;


-- Создание Sequence для Transactions
CREATE SEQUENCE transaction_seq
START 1000
INCREMENT 1
OWNED BY Transactions.transaction_id;


-- Использование Sequence в INSERT
INSERT INTO Transactions (transaction_id, user_id, listing_id, amount, payment_status)
VALUES (NEXTVAL('transaction_seq'), 2, 1, 200.50, 'Оплачен');



-- Привязка Sequence к таблице
ALTER TABLE Transactions ALTER COLUMN transaction_id SET DEFAULT NEXTVAL('transaction_seq');
