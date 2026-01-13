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
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama</th>
                <th>Email</th>
                <th>Pesan</th>
                <th>Aksi</th>
            </tr>
        </thead>
    <tbody id="data-biodata-pengunjung">
        <!--  data akan di masukan di sini,bisa dari backend atau statis -->
        <tr data-id="101" data-nama="Ahmad" data-email="ahmad@example.com">
            <td>101</td>
            <td>Ahmad</td>
            <td>ahmad@example.com</td>
            <td>Pesan pengunjung</td>
            <td><button onclick="editvistor (this)">Hapus</button></td>
        </tr>
        <tr>
            <td>102</td>
            <td>Siti</td>
            <td>siti@example.com</td>
            <td>Pesan pengunjung</td>
            <td><button onclick="editvistor (this)">Hapus</button></td>
        </tr>  
    </tbody>
</table>

<hr>


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

<?php
// pastikan skrip ini hanya di jalankan jika tombol submit di klik via post
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit_form'])) {

    //--- 1. Konwksi ke database --
    $severname = "localhost";
    $username = "root"; // sesuaikan dengan username db anda
    $password = ""; // sesuaikan dengan password db anda
    $dbname = "biodata_pengunjung"; // sesuaikan dengan nama database anda

    $conn = new mysqli($severname, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("koneksi gagal: " . $conn->connect_error);
    }

    // --- 2. Validasi dan sanitasi input ---

    //fungsi sanitasi dasar
    function sanitize_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $nama = sanitize_input($_POST['nama']);
    $email = sanitize_var($_POST['email']);
    $pesan = saniteze_input($_POST['pesan']);
    $errors = [];

    // validasi sisi server
    if (empty($nama)) {
        $errors[] = "Nama tidak boleh kosong.";
    }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Email tidak valid.";
    }

    // -- 3. insert data ke database ("jika tidak ada error") ---
    if (empty($errors)) {
        $stmt = $conn->prepare("INSERT INTO biodata_pengunjung (Nama, Email, Pesan) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $nama, $email, $pesan);

        if ($stmt->execute()) {
            // ---4. implementasi pola post/redirect/get (PRG) ---
            jika berhasil, redirect ke halaman form dengan pesan sukses
            header("Location: biodata_pengunjung.php?pesan=sukses");
            exit(); //penting untuk menghentikan eksekusi setelah redirect
        } else {
            // jika gagal saat insert db
            header("Location: biodata_pengunjung.php?pesan=gagal");
            exit();
        }

        $stmt->close();
    } else {
        // jika ada error validasi di server, bisa di tangani di sini
        // Dalam contoh sederhana ini, kita redirect dengan pesan gagal
        header("Location: biodata_pengunjung.php?pesan=gagal");
        exit();
    }

    $conn->close();

} else {
    // jika skrip di akses tanpa post, redirect ke form
    header("Location: biodata_pengunjung.php");
    exit();
}

</php>
if ($result ->num_rows > 0) {
   // output data setiap baris
   while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["id"] . "</td>";
        echo "<td>" . $row["nama"] . "</td>";
        echo "<td>" . $row["email"] . "</td>";
        echo "<td>" . $row["pesan"] . "</td>";
        // tautan edit dan hapus
        echo "</tr>";
        //link edit mengarah ke halaman edit_biodata_pengunjung.php dengan parameter id
        echo "<a  href='edit_biodata_pengunjung.php?id=" . $row["id"] . "'>Edit</a> | ";
        //link hapus mengarah ke halaman hapus_biodata_pengunjung.php dengan parameter id
        echo "<a  href='hapus_biodata_pengunjung.php?id=" . $row["id"] . "' onclick=\"return confirm('Apakah Anda yakin ingin menghapus data ini?');\">Hapus</a>";
        echo "</td>";
        echo "</tr>";
   }
} else {
   echo "<tr><td colspan='5'>Tidak ada data</td></tr>";
}
?>
</table>

</body>
</html>

< form action="biodata_pengunjung.php" method="post">
    <!-- input  field lainnya -->
    <button type="submit" name="biodata_pengunjung">kirim data</button>
</form>
<?php
$conn->close();
?>