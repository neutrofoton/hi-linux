# `watch`

`watch` adalah utilitas command-line di Linux yang menjalankan sebuah perintah secara berulang pada interval waktu tertentu, lalu menampilkan outputnya secara full-screen di terminal. 
Setiap kali perintah dijalankan ulang, layar akan di-refresh dengan hasil terbaru.

Perintah ini sangat berguna untuk memantau sesuatu yang berubah dari waktu ke waktu tanpa harus menjalankan perintah yang sama berulang kali secara manual, misalnya:

| Opsi | Fungsi |
|------|--------|
| `-n <detik>` | Mengatur interval refresh (default: 2 detik) |
| `-d` | Menyorot (*highlight*) bagian output yang berubah dari refresh sebelumnya |
| `-t` | Menyembunyikan judul/header (waktu dan nama perintah) di bagian atas |
| `-g` | Keluar otomatis jika output berubah |
| `-e` | Keluar otomatis jika perintah yang dijalankan mengembalikan error |
| `-c` | Menampilkan output dengan warna ANSI (jika perintah mendukung warna) |

- Memantau penggunaan resource sistem (CPU, memori, disk)
- Memantau status container Docker atau proses yang berjalan
- Memantau perubahan pada file atau direktori
- Memantau log atau status jaringan

```bash
# ubuntu
sudo apt update
sudo apt install procps

# rocky
sudo dnf install procps-ng
```

## Contoh
- Memantau docker container.
 
  ```bash
  # Menampilkan daftar container yang berjalan, diperbarui setiap 2 detik.
  watch -n 2 'sudo docker ps'
  ```
- Memantau Penggunaan Memori
  
  ```bash
  # Menampilkan penggunaan memori dalam format human-readable, diperbarui tiap detik.
  watch -n 1 free -h
  ```
- Memantau Penggunaan Disk
  ```bash
  watch df -h
  ```
- Memantau Perubahan pada Direktori
  ```bash
  watch -d 'ls -la /var/log'
  ```
