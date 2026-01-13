create table biodata pengunjung (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Pesan TEXT,
    Tanggal_kunjungan timestamp DEFAULT CURRENT_TIMESTAMP
);

<!DOCTYPE html>
<html lang="id">
<head>
    <meta cahrset="utf-8">
    <title>form biodata pengunjung</title>
</head>
<body>
    <h2>form biodata pengunjung</h2>

    <!-- menampilkan pesan feedback jika ada (setelah PRG) -->
    <?PHP IF (isset($_GET['pesan'])): ?>
        <?php if ($_get["pesan"]) == "sukses"
            <p style="color:green;">< Data Berhasil Dikirim! Terima Kasih.</p>
         <?php elseif ($_get["pesan"]) == "gagal"
            <p style="color:red;">< Data Terjadi Kesalahan, silahkan coba lagi.</p>
        <?php endif; ?>


