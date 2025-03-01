CREATE ROLE admin_role;
CREATE ROLE seller_role;
CREATE ROLE buyer_role;


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;
GRANT SELECT, INSERT, UPDATE ON users, listings TO seller_role;
GRANT SELECT ON users, listings TO buyer_role;