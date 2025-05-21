# SI-Penjadwalan-Sidang
## 🚀 Setup & Deployment Guide

---

## 📌 Prasyarat

Sebelum menjalankan proyek ini, pastikan Anda telah menginstal:

- [Docker Desktop](https://www.docker.com/products/docker-desktop) – Untuk menjalankan container Docker
- [Git](https://git-scm.com/) – Untuk mengelola kode sumber

---

## 📥 Instalasi Proyek

1. **Clone repository utama ke lokal:**
   ```bash
   git clone https://github.com/adzaniard/SI-Penjadwalan-Sidang.git
   cd SI-Penjadwalan-Sidang
   ```

2. **Clone repository backend ke dalam folder `backend`:**
   ```bash
   git clone https://github.com/MuhammadAbiAM/Jadwal-Skripsi.git backend
   ```

3. **Clone repository frontend ke dalam folder `frontend`:**
   ```bash
   git clone https://github.com/amandasafii/SI-JadwalSkripsi.git frontend
   ```

---

## 🛠 Konfigurasi

### 🔧 Backend (`backend/`)

1. **Edit file `backend/app/Config/Database.php`**
   ```php
   'hostname' => 'db', // sebelumnya 'localhost'
   ```

2. **Edit file `backend/.env`**
   - Ubah `app.baseURL`:
     - Buka **Laragon**, klik kanan > **www** > buka folder `backend`
     - Salin path dari search bar Explorer dan tempelkan ke `app.baseURL`
   - Ubah:
     ```.env
     database.default.hostname = db
     ```

---

### 🔧 Frontend (`frontend/`)

1. **Salin `.env.example` sebagai `.env`**
   ```bash
   cp .env.example .env
   ```

2. **Edit file `frontend/.env` menjadi seperti berikut:**
   ```.env
   APP_NAME=Laravel
   APP_ENV=local
   APP_KEY=base64:biVr2oU6EUcT1/A/PYBZ9Dk2r5kX+A6RLObnvDO8BkA=
   APP_DEBUG=true
   APP_URL=http://localhost

   LOG_CHANNEL=stack
   LOG_DEPRECATIONS_CHANNEL=null
   LOG_LEVEL=debug

   DB_CONNECTION=mysql
   # DB_HOST=127.0.0.1
   # DB_PORT=3306
   # DB_DATABASE=penjadwalan_sidang
   # DB_USERNAME=root
   # DB_PASSWORD=

   BROADCAST_DRIVER=log
   CACHE_DRIVER=file
   FILESYSTEM_DISK=local
   QUEUE_CONNECTION=sync
   SESSION_DRIVER=file
   SESSION_LIFETIME=120

   MEMCACHED_HOST=127.0.0.1

   REDIS_HOST=127.0.0.1
   REDIS_PASSWORD=null
   REDIS_PORT=6379

   MAIL_MAILER=smtp
   MAIL_HOST=mailpit
   MAIL_PORT=1025
   MAIL_USERNAME=null
   MAIL_PASSWORD=null
   MAIL_ENCRYPTION=null
   MAIL_FROM_ADDRESS="hello@example.com"
   MAIL_FROM_NAME="${APP_NAME}"

   AWS_ACCESS_KEY_ID=
   AWS_SECRET_ACCESS_KEY=
   AWS_DEFAULT_REGION=us-east-1
   AWS_BUCKET=
   AWS_USE_PATH_STYLE_ENDPOINT=false

   PUSHER_APP_ID=
   PUSHER_APP_KEY=
   PUSHER_APP_SECRET=
   PUSHER_HOST=
   PUSHER_PORT=443
   PUSHER_SCHEME=https
   PUSHER_APP_CLUSTER=mt1

   VITE_APP_NAME="${APP_NAME}"
   VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
   VITE_PUSHER_HOST="${PUSHER_HOST}"
   VITE_PUSHER_PORT="${PUSHER_PORT}"
   VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
   VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
   ```

---

## 🐳 Menjalankan Proyek dengan Docker

1. **Pastikan Docker aktif**

2. **Build dan jalankan container:**
   ```bash
   docker-compose up -d --build
   ```

3. **Periksa container berjalan:**
   ```bash
   docker ps
   ```

---

## 🌐 Akses Aplikasi

- **Backend (CodeIgniter):** [http://localhost:8080](http://localhost:8080)  
- **Frontend (Laravel):** [http://localhost:8000](http://localhost:8000)

---

## 🚀 Menjalankan Aplikasi

- Buka di browser:
  ```
  http://localhost:8082
  ```

- Lihat log jika terjadi error:
  ```bash
  docker-compose logs -f
  ```

- Restart container jika perlu:
  ```bash
  docker-compose restart
  ```

---

## 🔄 Update & Rebuild

Jika ada perubahan dalam kode:

```bash
git pull origin main
docker-compose up -d --build
```

---

## 🛑 Stop & Remove Containers

Untuk menghentikan semua layanan:

```bash
docker-compose down
```

---

## 🔧 Troubleshooting

- Pastikan tidak ada aplikasi lain yang menggunakan port yang sama.
- Jika ada perubahan dalam `docker-compose.yml`, jalankan ulang dengan:
  ```bash
  docker-compose up -d --force-recreate --build
  ```
- Untuk menghentikan dan menghapus semua container:
  ```bash
  docker-compose down
  ```

---

## 📢 Catatan Tambahan

- Pastikan Anda memiliki koneksi internet yang stabil saat menarik dependensi pertama kali.
- Gunakan perintah `docker system prune -a` untuk membersihkan container yang tidak terpakai.
- Pastikan file `.env` sudah disesuaikan dengan lingkungan dan konfigurasi Anda

---

Selamat menggunakan proyek **SI-Penjadwalan-Sidang**! 🚀
