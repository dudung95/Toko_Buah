<?php
include 'config.php';

// Cek koneksi
if($koneksi) {
    echo "Koneksi ke database BERHASIL!";
} else {
    echo "Koneksi ke database GAGAL!";
}
?> 