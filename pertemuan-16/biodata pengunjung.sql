create table biodata pengunjung (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Pesan TEXT,
    Tanggal_kunjungan timestamp DEFAULT CURRENT_TIMESTAMP
);
