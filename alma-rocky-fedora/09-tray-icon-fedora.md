# Ringkasan: Setup Tray Icon Flameshot di Fedora (GNOME)

## Masalah
Flameshot terinstall dan berjalan (`ps aux` menunjukkan proses aktif), tapi iconnya tidak muncul di top bar karena GNOME secara default tidak menampilkan system tray icon tanpa extension tambahan.

## Langkah-langkah yang Dilakukan

### 1. Install extension AppIndicator
```bash
sudo dnf install gnome-shell-extension-appindicator
```
Menginstall package `gnome-shell-extension-appindicator` beserta dependency `libappindicator-gtk3` — berhasil terinstall.

### 2. Cek status Flameshot
```bash
ps aux | grep flameshot
```
Konfirmasi Flameshot memang sudah berjalan di background.

### 3. Install GNOME Extensions App (untuk mengelola extension via GUI)
```bash
sudo dnf install gnome-extensions-app
gnome-extensions-app
```

### 4. Aktifkan extension AppIndicator
Via GUI: buka **Extensions** → cari **"AppIndicator and KStatusNotifierItem Support"** → nyalakan toggle.

Atau via terminal:
```bash
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
```

### 5. Restart session / Flameshot
- **Wayland**: wajib logout–login (`Alt+F2` → `r` hanya berlaku di Xorg)
- Restart proses Flameshot:
```bash
killall flameshot
flameshot &
```

### 6. Verifikasi extension aktif
```bash
gnome-extensions list --enabled
```

---

**Catatan:** GNOME Tweaks disebutkan sebagai tool terkait untuk mengelola pengaturan GNOME secara umum (termasuk extension), meski di kasus ini yang lebih relevan digunakan adalah **GNOME Extensions App**. Kalau mau install juga:
```bash
sudo dnf install gnome-tweaks
```