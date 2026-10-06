-- p01_lingkungan_25430013.sql 
-- Password sengaja diganti penanda. JANGAN commit password asli. 
CREATE DATABASE IF NOT EXISTS kopma_013 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 
CREATE USER IF NOT EXISTS 'mhs_013'@'localhost' IDENTIFIED BY 'password_kerja'; 
GRANT ALL PRIVILEGES ON kopma_013.* TO 'mhs_013'@'localhost'; 
