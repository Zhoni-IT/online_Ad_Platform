SELECT conrelid::regclass AS table_name, conname AS constraint_name, contype 
FROM pg_constraint 
ORDER BY table_name;
