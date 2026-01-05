# Setup & Konfigurasi Project (Database + Tomcat)

Dokumen ini menjelaskan langkah menjalankan project Java Web di lingkungan baru. Project tidak menyimpan password database di dalam kode. Hal ini dilakukan untuk menghindari hard-coded password. 
Project ini telah dikonfigurasi dengan best practice keamanan, konfigurasi fleksibel, dan siap dijalankan di environment baru menggunakan password berbeda.

---

## 1. Prasyarat
Pastikan software berikut sudah terinstall:
- Java JDK 8 atau lebih baru
- NetBeans IDE
- Apache Tomcat (disarankan Tomcat dari XAMPP)
- MySQL / MariaDB (misalnya dari XAMPP)

---

## 2. Konfigurasi Database
### 2.1. Login ke MySQL 
- Buka folder: C:\xampp\mysql\bin
- Buka Command Prompt: mysql -u root -p
- Masukkan password MySQL Anda (jika kosong, tekan Enter).
### 2.2. Buat Database 
- Import file hmit_db.sql di admin MySQL

---

## 3. Konfigurasi Environment Variable (WAJIB)
Password database tidak disimpan di kode, tetapi dibaca dari Environment Variable.
### 3.1. Lokasi Tomcat
- Pastikan Tomcat yang digunakan berada di C:\xampp\tomcat
### 3.2. Membuat File setenv.bat
- Buka folder: C:\xampp\tomcat\bin
- Buat file baru bernama: setenv.bat
- Isi file tersebut dengan: set DB_PASSWORD= x
*x : Isi password harus sesuai dengan password user MySQL yang digunakan.
### 3.3. Jalankan Projek Tugas Besar
- Buka Netbeans
- Import Project : PBO-HMIT.zip
- Jalankan project
