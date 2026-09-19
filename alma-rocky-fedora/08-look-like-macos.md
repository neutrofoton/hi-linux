# Membuat Dock Fedora (GNOME) Selalu Tampil (Mirip Mac)

## 1. Install extension Dash to Dock
sudo dnf install gnome-shell-extension-dash-to-dock

## 2. Restart GNOME Shell
- X11: tekan `Alt+F2`, ketik `r`, lalu Enter
- Wayland (default Fedora): logout lalu login lagi

## 3. Aktifkan extension
- Buka aplikasi **Extensions**
- Cari **Dash to Dock**, aktifkan toggle-nya
- Klik ikon gear di sampingnya untuk buka pengaturan

## 4. Matikan Auto-hide
- Masuk tab **Behavior**
- Matikan **Autohide** (atau aktifkan **Dock fixed**)

## Alternatif via terminal (gsettings)
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false

### Untuk mengembalikan ke semula
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true