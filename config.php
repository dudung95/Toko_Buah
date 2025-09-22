<?php
// Konfigurasi koneksi database
$host = "localhost";     // Host database
$username = "root";      // Username database
$password = "";          // Password database (kosong untuk default Laragon)
$database = "db_toko_buah";  // Nama database

// Membuat koneksi
$koneksi = mysqli_connect($host, $username, $password, $database);

// Cek koneksi
if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Set karakter encoding
mysqli_set_charset($koneksi, "utf8");
?> 