SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'your_db_username') AS user_exists;
CREATE USER IF NOT EXISTS 'your_db_username'@'%';
GRANT ALL PRIVILEGES ON emr2.* TO 'your_db_username'@'%';
FLUSH PRIVILEGES;