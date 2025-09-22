-- Buat database
CREATE DATABASE IF NOT EXISTS db_toko_buah;
USE db_toko_buah;

-- Tabel users (admin dan kasir)
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(32) NOT NULL,
    role ENUM('admin', 'kasir') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel produk (buah-buahan)
CREATE TABLE IF NOT EXISTS produk (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel penjualan
CREATE TABLE IF NOT EXISTS penjualan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_kasir INT NOT NULL,
    tanggal DATETIME NOT NULL,
    total_harga DECIMAL(10,2) NOT NULL,
    total_bayar DECIMAL(10,2) NOT NULL,
    kembalian DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_kasir) REFERENCES users(id)
);

-- Tabel detail_penjualan
CREATE TABLE IF NOT EXISTS detail_penjualan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_penjualan INT NOT NULL,
    id_produk INT NOT NULL,
    jumlah INT NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id),
    FOREIGN KEY (id_produk) REFERENCES produk(id)
);

-- Insert data admin default
INSERT INTO users (username, password, role) VALUES 
('admin', MD5('admin123'), 'admin'),
('kasir', MD5('kasir123'), 'kasir');

-- Insert data produk contoh
INSERT INTO produk (nama_produk, harga, stok) VALUES 
('Apel', 15000, 50),
('Pisang', 10000, 100),
('Jeruk', 12000, 75),
('Mangga', 20000, 30),
('Anggur', 25000, 25); 