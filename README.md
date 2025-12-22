# PWD-BLY-2025-15115300211-1
Repository Latihan Pertemuan-1 sampai dengan Pertemuan-16<br>
Matakuliah Pemrograman Web Dasar<br>
Tahun Ajaran 2025/2026
Semester Gasal<br><br>
![logo ISBAL](logoisbal.png.png)

1..16 | ForEach-Object {  
$folder = "pertemuan-{0:D2}" -f $_ 
New-Item -Path "$folder\README.md" -ItemType File -Value "# $folder" 
}

git commit -m "upload logo, modifikasi file README.md dan mark down gambar"