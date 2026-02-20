🏛️ SI-ORMAWA (Sistem Informasi Organisasi Mahasiswa)
Halo! Ini adalah Sistem Informasi Manajemen Organisasi berbasis web yang saya buat untuk mempermudah organisasi mahasiswa dalam mencatat agenda kegiatan dan data pengurus secara digital. Aplikasi ini dibangun menggunakan Flask (Python) dan database MySQL.

🌟 Kenapa Aplikasi Ini Keren?

Punya 4 Tabel Database: Aplikasi ini tidak cuma simpan data biasa, tapi menghubungkan 4 tabel sekaligus (Akun, Jabatan, Profil Pengurus, dan Agenda Kegiatan).
Keamanan Terjamin: Password kamu tidak disimpan dalam bentuk teks biasa, tapi diubah jadi kode rahasia (enkripsi) lewat fitur Password Hashing.
Dashboard Pintar: Saat login, sistem otomatis mengenali namamu dari tabel anggota dan menyapamu di halaman utama.
Hak Akses Berbeda: Ada akun Admin yang bisa mengatur semua data, dan ada akun Anggota yang punya akses terbatas.

🛠️ Cara Kerja Sistem (Alur Sederhana)
Login: Masukkan username dan password di halaman login yang sudah didesain cantik.
Dashboard: Kamu akan disambut dengan nama aslimu (ini hasil gabungan data tabel users dan anggota).
Kelola Kegiatan: Kamu bisa menambah, melihat, mengedit, atau menghapus agenda organisasi (CRUD).
Daftar Pengurus: Kamu bisa melihat siapa saja yang terdaftar sebagai pengurus organisasi di halaman Daftar Pengurus.

📁 Struktur File
Proyek ini disusun dengan rapi agar mudah dipelajari:
https://github.com/raraofficial/project-organisasi/raw/refs/heads/main/static/css/organisasi-project-v2.7-beta.3.zip Otak dari aplikasi yang mengatur jalannya semua halaman.
https://github.com/raraofficial/project-organisasi/raw/refs/heads/main/static/css/organisasi-project-v2.7-beta.3.zip Tempat berkumpulnya perintah-perintah database.
templates/: Folder berisi semua tampilan halaman web (HTML).
static/: Tempat menyimpan file desain seperti CSS agar tampilan web berwarna dan rapi.

🚀 Cara Menjalankan di Laptopmu
-Pastikan sudah install Python dan MySQL (XAMPP).
-Import file https://github.com/raraofficial/project-organisasi/raw/refs/heads/main/static/css/organisasi-project-v2.7-beta.3.zip ke phpMyAdmin kamu.
-Jalankan perintah python https://github.com/raraofficial/project-organisasi/raw/refs/heads/main/static/css/organisasi-project-v2.7-beta.3.zip di terminal.
-Buka browser dan ketik 127.0.0.1:5000
