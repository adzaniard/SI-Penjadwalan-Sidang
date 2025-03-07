# SI-Penjadwalan-Sidang
# 🚀 Setup & Deployment Guide

## 📌 Prerequisites
Sebelum menjalankan proyek ini, pastikan Anda telah menginstal perangkat lunak berikut:

- [Docker Desktop](https://www.docker.com/products/docker-desktop) - Untuk menjalankan container Docker.
- [Git](https://git-scm.com/) - Untuk mengelola kode sumber.

## 📥 Installation

1. **Clone repository ini ke lokal**:
   ```sh
   git clone https://github.com/username/repository.git
   ```
2. **Masuk ke direktori proyek**:
   ```sh
   cd repository
   ```

## 🛠 Setup & Configuration

1. **Pastikan Docker dalam keadaan berjalan.**
2. **Buat file `.env` berdasarkan contoh yang tersedia:**
   ```sh
   cp .env.example .env
   ```
3. **Jalankan perintah berikut untuk membangun dan menjalankan container:**
   ```sh
   docker-compose up -d --build
   ```
4. **Cek apakah container berjalan dengan benar:**
   ```sh
   docker ps
   ```

## 🌐 Akses Aplikasi

- **Backend (CodeIgniter):** [http://localhost:8080](http://localhost:8080)
- **Frontend (Laravel):** [http://localhost:3000](http://localhost:3000)
- **PHPMyAdmin (Opsional):** [http://localhost:8080](http://localhost:8080)

## 🚀 Running the Application

1. **Akses aplikasi melalui browser:**
   ```
   http://localhost:3000
   ```
2. **Melihat logs aplikasi jika terjadi error:**
   ```sh
   docker-compose logs -f
   ```
3. **Jika perlu, restart container dengan:**
   ```sh
   docker-compose restart
   ```

## 🔄 Update & Rebuild

Jika ada perubahan dalam kode, jalankan:
```sh
   git pull origin main
   docker-compose up -d --build
```

## 🛑 Stop & Remove Containers

Jika ingin menghentikan layanan, jalankan:
```sh
   docker-compose down
```

## 🔧 Troubleshooting

- **Pastikan tidak ada layanan lain yang menggunakan port yang sama.**
- **Jika ada perubahan dalam `docker-compose.yml`, jalankan ulang dengan:**
  ```sh
  docker-compose up -d --force-recreate --build
  ```
- **Untuk menghentikan dan menghapus semua container:**
  ```sh
  docker-compose down
  ```

## 📢 Notes
- Pastikan Anda memiliki koneksi internet yang stabil saat menarik dependensi pertama kali.
- Gunakan perintah `docker system prune -a` untuk membersihkan container yang tidak terpakai.

---
Selamat menggunakan proyek ini! 🚀
