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

        <form action="proses biodata pengunjung.php" method="post">
            <label for="nama">Nama:</label><br>
            <input type="text" id="nama" name="nama" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="pesan">Pesan:</label><br>
            <textarea id="pesan" name="pesan" rows="4" cols="50"></textarea><br><br>

            <button type="submit" name="submit_form">kirim data</button>
        </form>
    </body>
</html>
