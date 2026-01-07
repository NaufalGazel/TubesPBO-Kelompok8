# Setup & Konfigurasi Project (Database + Tomcat)

Dokumen ini menjelaskan langkah menjalankan project Java Web di lingkungan baru. 
Project tidak menyimpan password database di dalam kode, tetapi dibaca dari Environment Variable. Hal ini dilakukan untuk menghindari hard-coded password. 
Project ini telah dikonfigurasi dengan best practice keamanan, konfigurasi fleksibel, dan siap dijalankan di environment baru menggunakan password berbeda.

---

## 1. Prasyarat
Pastikan software berikut sudah terinstall:
- Java JDK 11
- NetBeans IDE
- Apache Tomcat (disarankan Tomcat dari XAMPP)
- MySQL / MariaDB (misalnya dari XAMPP)

---

## 2. Konfigurasi Database
Penting: xxxxx ganti dengan password yang diinginkan dan konsisten hingga akhir konfigurasi
### 2.1. Buat Database
- Buka phpmyadmin setelah menghidupkan modul Apache dan MySQL di XAMPP Control Panel
- Buat database baru dengan nama: hmit_db
- Import file hmit_db.sql di dalam database hmit_db yang telah dibuat tadi
### 2.2. Login ke MySQL 
- Buka folder: C:\xampp\mysql\bin
- Buka Command Prompt: mysql -u root -p
- Masukkan password MySQL Anda (jika kosong, tekan Enter).
### 2.3. Buat User dan Host Baru pada Server MySQL
- Lanjutkan Command Prompt:
  CREATE USER 'app_user'@'localhost'
  IDENTIFIED BY 'xxxxx';
- Buka phpmyadmin lalu pada server masukkan prompt SQL berikut:
  SELECT User, Host FROM mysql.user;
- Pastikan di dalam tabel terdapat User: app_user dan Host: localhost 
### 2.4. Pemberian Hak Akses ke Database hmit_db
- Lanjutkan Command Prompt:
  GRANT ALL PRIVILEGES ON hmit_db.* TO 'app_user'@'localhost';
  FLUSH PRIVILEGES;
- Command Prompt keluar dari user root: EXIT;

---

## 3. Konfigurasi Environment Variable
Penting: xxxxx ganti dengan password yang diinginkan dan konsisten hingga akhir konfigurasi
### 3.1. Lokasi Tomcat
- Pastikan Tomcat yang digunakan berada di C:\xampp\tomcat
### 3.2. Membuat File setenv.bat
- Buka folder: C:\xampp\tomcat\bin
- Buat file baru bernama: setenv.bat
  - copy file yang memiliki type: Windows Batch File
  - rename dan buka notepad untuk mengganti isi file dengan: set DB_PASSWORD=xxxxx
### 3.3. Jalankan Projek Tugas Besar
- Tentukan lokasi extract project: PBO-HMIT.zip 
- Buka Netbeans lalu open project (Ctrl+Shift+O)
- Sesuaikan lokasi project yang telah ditentukan 
- Jalankan project
