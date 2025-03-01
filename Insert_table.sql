-- Заполнение таблицы Roles
INSERT INTO Roles (role_name) VALUES 
('Әкімші'), 
('Қолданушы'), 
('Сатушы');

-- Заполнение таблицы Users
INSERT INTO Users (name, email, phone, password_hash, role_id) VALUES 
('Айжан Ахметова', 'aizhan@example.com', '+77011234567', 'hashed_password1', 2),
('Бауыржан Қанатұлы', 'b.kanat@example.com', '+77029876543', 'hashed_password2', 3),
('Медет Ермеков', 'medet@example.com', '+77035678901', 'hashed_password3', 1);

-- Заполнение таблицы Categories
INSERT INTO Categories (name, parent_category_id) VALUES 
('Электроника', NULL),
('Киім-кешек', NULL),
('Телефондары', 1);

-- Заполнение таблицы Listing_Status
INSERT INTO Listing_Status (status_name) VALUES 
('Белсенді'), 
('Күтуде'), 
('Жабық');

-- Заполнение таблицы Cities
INSERT INTO Cities (city_name, country) VALUES 
('Алматы', 'Қазақстан'), 
('Астана', 'Қазақстан'), 
('Шымкент', 'Қазақстан');

-- Заполнение таблицы Locations
INSERT INTO Locations (city_id, district) VALUES 
(1, 'Бостандық ауданы'), 
(2, 'Есіл ауданы'), 
(3, 'Абай ауданы');

-- Заполнение таблицы Listings
INSERT INTO Listings (user_id, title, description, price, category_id, location_id, status_id) VALUES 
(1, 'Samsung Galaxy S23', 'Жаңа смартфон, 256 ГБ жады', 350000.00, 3, 1, 1),
(2, 'Қыстық күртке', 'Ерлерге арналған жылы күртке, жаңа', 45000.00, 2, 2, 1),
(3, 'Ноутбук Lenovo', 'Intel i7, 16GB RAM, 512GB SSD', 550000.00, 1, 3, 2);

-- Заполнение таблицы Attributes
INSERT INTO Attributes (category_id, name) VALUES 
(1, 'Процессор түрі'), 
(2, 'Өлшемі'), 
(3, 'Жады көлемі');

-- Заполнение таблицы Listing_Attributes
INSERT INTO Listing_Attributes (listing_id, attribute_id, value) VALUES 
(1, 3, '256 ГБ'), 
(2, 2, 'L өлшемі'), 
(3, 1, 'Intel i7');

-- Заполнение таблицы Images
INSERT INTO Images (listing_id, image_url) VALUES 
(1, 'https://example.com/s23.jpg'), 
(2, 'https://example.com/jacket.jpg'), 
(3, 'https://example.com/laptop.jpg');

-- Заполнение таблицы Videos
INSERT INTO Videos (listing_id, video_url) VALUES 
(1, 'https://example.com/s23.mp4'), 
(2, 'https://example.com/jacket.mp4'), 
(3, 'https://example.com/laptop.mp4');

-- Заполнение таблицы Files
INSERT INTO Files (listing_id, file_url) VALUES 
(1, 'https://example.com/s23_specs.pdf'), 
(2, 'https://example.com/jacket_info.pdf'), 
(3, 'https://example.com/laptop_specs.pdf');

-- Заполнение таблицы Messages
INSERT INTO Messages (sender_id, receiver_id, listing_id, content) VALUES 
(1, 2, 1, 'Смартфон әлі сатылымда ма?'), 
(2, 3, 2, 'Күртке L өлшемінде бар ма?'), 
(3, 1, 3, 'Ноутбукке кепілдік беріле ме?');

-- Заполнение таблицы Reviews
INSERT INTO Reviews (reviewer_id, reviewed_user_id, rating, comment) VALUES 
(1, 2, 5, 'Тауар сапалы, сатушы өте жауапты!'), 
(2, 3, 4, 'Жақсы ноутбук, бірақ зарядтағышы жоқ болды.'), 
(3, 1, 5, 'Тез жеткізілді, тамаша қызмет!');

-- Заполнение таблицы Favorites
INSERT INTO Favorites (user_id, listing_id) VALUES 
(1, 2), 
(2, 3), 
(3, 1);

-- Заполнение таблицы Transactions
INSERT INTO Transactions (user_id, listing_id, amount, payment_status) VALUES 
(1, 1, 350000.00, 'Төленді'), 
(2, 2, 45000.00, 'Төленді'), 
(3, 3, 550000.00, 'Күтілуде');

-- Заполнение таблицы Payments
INSERT INTO Payments (user_id, amount, method, status) VALUES 
(1, 350000.00, 'Банктік карта', 'Сәтті'), 
(2, 45000.00, 'Kaspi QR', 'Сәтті'), 
(3, 550000.00, 'QIWI әмиян', 'Күтілуде');

-- Заполнение таблицы Promotions
INSERT INTO Promotions (listing_id, type, duration, price) VALUES 
(1, 'VIP', 7, 5000.00), 
(2, 'Жарнамаланған', 5, 3000.00), 
(3, 'Басты бетке шығару', 10, 8000.00);

-- Заполнение таблицы Logs
INSERT INTO Logs (user_id, action, ip_address) VALUES 
(1, 'Жарнама жариялады', '192.168.1.1'), 
(2, 'Төлем жасады', '192.168.1.2'), 
(3, 'Қолданушы пікір қалдырды', '192.168.1.3');

-- Заполнение таблицы Reports
INSERT INTO Reports (reported_listing_id, reported_by_user_id, reason, report_status) VALUES 
(1, 2, 'Тауар сипаттамасы дұрыс емес', 'Қаралуда'), 
(2, 3, 'Сатушы жауап бермейді', 'Тексерілді'), 
(3, 1, 'Бағасы тым жоғары', 'Қабылданбады');
