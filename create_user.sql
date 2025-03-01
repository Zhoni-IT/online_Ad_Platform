CREATE USER admin_user WITH ENCRYPTED PASSWORD 'admin_pass';
GRANT admin_role TO admin_user;

CREATE USER seller_user WITH ENCRYPTED PASSWORD 'seller_pass';
GRANT seller_role TO seller_user;

CREATE USER buyer_user WITH ENCRYPTED PASSWORD 'buyer_pass';
GRANT buyer_role TO buyer_user;
