# Troubleshooting: Hardisk Tidak Terdeteksi di Installer Linux (Fedora/Anaconda)

Catatan berdasarkan kasus nyata: laptop dengan Windows + Rocky Linux, mau install Fedora tapi disk NVMe tidak muncul di installer (Anaconda WebUI menampilkan "No disks available").

## Alur diagnosa (urutkan dari yang paling gampang)

### 1. Cek apakah kernel Linux sebenarnya melihat disk-nya
Buka Terminal di live session, jalankan:
```bash
lsblk
sudo fdisk -l
sudo parted -l
```

**Hasil yang normal/sehat** — disk internal muncul dengan model & ukuran yang jelas, tanpa pesan error:
```
Model: CT1000P3SSD8 (nvme)
Disk /dev/nvme0n1: 1000GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End    Size    File system  Name                       Flags
 1      1049kB  534MB  532MB   fat32        EFI System Partition       boot, esp
 2      534MB   551MB  16.8MB               Microsoft reserved partition  msftres
 3      551MB   210GB  209GB   ntfs         Basic data partition       msftdata
```
Yang penting dicek:
- Disk **muncul** dengan Model & Size yang masuk akal (bukan kosong/`Unknown`).
- Tidak ada warning aneh selain soal `/dev/sda` (itu USB installer-nya sendiri, warning "not all space available" di situ **normal**, aman pilih **Ignore**).
- Kalau ada partisi Windows, `File system` untuk partisi utamanya harus `ntfs` (bukan kosong/`unknown`).

**Tanda ada masalah**:
- Disk `nvme0n1`/`sda` (internal) **sama sekali tidak muncul** di output → lanjut ke langkah 2 (BIOS/driver).
- Disk muncul tapi ada partisi dengan `File system` kosong padahal harusnya terisi (misal MSR yang seharusnya kosong malah kedetect `iso9660`/format lain) → itu tanda ada signature nyangkut, lanjut ke langkah 6.

- **Kalau disk MUNCUL** di sini (misal `nvme0n1`) → masalah bukan di hardware/driver, lanjut ke langkah 3.
- **Kalau disk TIDAK muncul sama sekali** → kemungkinan masalah BIOS/driver, lanjut ke langkah 2.

### 2. Cek setting BIOS/UEFI (kalau kernel juga tidak lihat disk)
- **SATA Mode**: pastikan di **AHCI**, bukan **RAID/Intel RST** (kalau perlu ganti, di Windows edit dulu registry `HKLM\SYSTEM\CurrentControlSet\Services\storahci\Start` = 0 sebelum ganti BIOS, supaya Windows tetap bisa boot).
- **Intel VMD (Volume Management Device)**: untuk disk NVMe, coba disable dulu kalau aktif — beberapa live ISO gagal load driver VMD di awal boot.
- Pastikan flashdisk installer di-boot dalam mode **UEFI**, bukan Legacy/CSM (terutama kalau OS lain di disk pakai GPT/UEFI).

### 3. Cek aplikasi Disks (GNOME Disks) — bukan cuma installer
Buka aplikasi **Disks**. **Hasil normal**: semua disk yang muncul di `lsblk` juga muncul di sidebar kiri Disks (biasanya ditulis nama model + kapasitas, misal "1.0 TB Hard Disk"), lengkap dengan partisi-partisinya.

**Tanda ada masalah**: kalau GNOME Disks **tidak** menampilkan disk itu padahal `lsblk`/`parted -l` sudah lihat → ini bug di layer **udisks2/blivet**, bukan kernel. Lanjut ke langkah 4-6.

### 4. Cek leftover LVM dari instalasi Linux lama
```bash
sudo vgs
sudo lvs
```
**Hasil normal** kalau tidak ada LVM tersisa: output kosong (tidak ada baris VG/LV sama sekali).

**Kalau ada leftover**, biasanya kelihatan seperti ini (contoh dari kasus Rocky Linux):
```
VG  #PV #LV #SN Attr   VSize   VFree
rl    1   3   0 wz--n- 735.23g    0

LV    VG  Attr        LSize
home  rl  -wi-------  658.42g
root  rl  -wi-------   70.00g
swap  rl  -wi-------    6.81g
```
Perhatikan kolom `Attr` pada LV — kalau ada huruf **`a`** di posisi ke-5 (misal `-wi-a-----`), berarti LV itu **aktif**; kalau `-` (seperti contoh di atas), berarti sudah **inactive**. LVM lama yang mau dihapus boleh aktif maupun inactive, sama saja — tinggal:
```bash
sudo vgremove -f <nama_vg>
```
**Hasil sukses** setelah `vgremove`:
```
Logical volume "swap" successfully removed.
Logical volume "home" successfully removed.
Logical volume "root" successfully removed.
Volume group "rl" successfully removed
```

### 5. Cek & hapus partisi OS lama yang mau digantikan
```bash
sudo parted /dev/nvme0n1 print   # pastikan nomor partisi yang mau dihapus
sudo wipefs -a /dev/nvme0nXpN    # bersihkan signature filesystem
sudo parted /dev/nvme0n1 rm N    # hapus partisi dari partition table
```
**Hasil normal** setelah `wipefs -a`: menunjukkan signature yang berhasil dihapus, contoh:
```
/dev/nvme0n1p5: 8 bytes were erased at offset 0x00000218 (LVM2_member): 4c 56 4d 32 20 30 30 31
```
**Hasil normal** setelah `parted ... rm N`: cuma muncul info netral, bukan error:
```
Information: You may need to update /etc/fstab.
```
**Verifikasi akhir** dengan `parted /dev/nvme0n1 print` — partisi yang dihapus sudah tidak ada di list, dan disk total size dikurangi ukuran partisi yang dihapus = free space yang sekarang tersedia.

⚠️ Selalu double check nomor partisi sebelum `rm` — jangan sampai kehapus partisi Windows.

### 6. Cek sisa "sampah" signature filesystem di partisi lain (biang bug yang sering kelewat)
Kadang partisi yang **seharusnya kosong** (misal Microsoft Reserved Partition/MSR) masih menyimpan signature filesystem lama (misal sisa ISO installer distro lain yang pernah dipakai di area disk itu). Ini bisa bikin blivet stuck loop "incomplete/hidden" terus dan **seluruh disk jadi tidak muncul** di installer.

Cek log storage untuk lihat gejalanya:
```bash
sudo grep -i "nvme" /tmp/storage.log | tail -100
```
**Tanda ada masalah**: baris yang sama berulang-ulang tanpa berhenti/berubah, semua bertuliskan `incomplete: True ; hidden: True`, misal:
```
DeviceTree.get_device_by_device_id: device_id: nvme0n1p2 ; incomplete: True ; hidden: True ;
DeviceTree.get_device_by_device_id returned existing 16 MiB partition nvme0n1p2 (99) with existing iso9660 filesystem
```
Ini artinya blivet gagal "menyelesaikan" resolusi partisi tersebut dan disk induknya jadi ikut tidak dianggap siap/available. Kalau semua partisi (termasuk yang sehat seperti NTFS Windows) ikut stuck seperti ini, curigai ada 1 partisi dengan data/signature yang tidak konsisten (contoh di sesi ini: partisi MSR yang seharusnya kosong tapi kedetect `iso9660`).

Cek juga apakah ada exception fatal (bukan cuma warning kecil):
```bash
sudo grep -iE "traceback|exception|error" /tmp/storage.log | tail -60
```
**Hasil normal/aman** — cuma ada 1 baris seperti ini, dan boleh diabaikan (tidak berhubungan dengan disk):
```
ERROR:program:Error running /usr/libexec/fcoe/fcoe_edd.sh: No such file or directory
```
**Kalau ada `Traceback (most recent call last):`** diikuti beberapa baris `File "..."` dan nama exception Python (misal `ValueError`, `DeviceError`) — itu baru error sungguhan yang perlu diteliti lebih lanjut (biasanya menyebut nama device/partisi tertentu di baris terakhir).

Lalu cek isi partisi yang dicurigai:
```bash
sudo blkid /dev/nvme0nXpN
sudo wipefs -n /dev/nvme0nXpN     # dry-run, lihat signature apa yang ada
```
**Hasil normal** untuk partisi yang seharusnya kosong (misal MSR): **tidak ada output sama sekali** dari `wipefs -n` dan `blkid` cuma menunjukkan `PARTUUID`/`PARTLABEL` tanpa `TYPE=`.

**Tanda ada masalah** — `blkid` menunjukkan `TYPE=` yang tidak seharusnya ada di situ, contoh nyata dari sesi ini:
```
/dev/nvme0n1p2: BLOCK_SIZE="2048" UUID="2023-11-10-20-59-25-00" LABEL="AlmaLinux-9-3-x86_64-dvd" TYPE="iso9660" PTTYPE="dos" PARTLABEL="Microsoft reserved partition"
```
(Perhatikan: `PARTLABEL` bilang ini partisi Microsoft Reserved, tapi `TYPE`/`LABEL` malah nunjukin sisa ISO AlmaLinux — jelas nyampah dari instalasi lama.)

Kalau ketemu signature aneh seperti itu:
```bash
sudo wipefs -a --force /dev/nvme0nXpN
```
**Hasil sukses**:
```
/dev/nvme0n1p2: 5 bytes were erased at offset 0x00008001 (iso9660): 43 44 30 30 31
```
Verifikasi ulang dengan `blkid` dan `wipefs -n` — harusnya sekarang kosong/tanpa output.

### 7. Reboot total (bukan cuma "Rescan devices")
Setelah perubahan partisi/LVM/signature, **reboot penuh** sistem (bukan cuma klik Rescan di dialog installer) supaya blivet scan storage dari kondisi bersih:
```bash
sudo systemctl reboot
```
> Kalau `sudo reboot` diblokir ("Operation inhibited... user session inhibited"), tutup dulu aplikasi installer, atau pakai `sudo systemctl reboot -i` (ignore inhibitors).

### 8. Cek ulang di installer
Masuk lagi ke live USB → buka installer → **Select/Change Destination** → disk seharusnya sudah muncul.

**Hasil normal/berhasil**: dialog "Select destination" menampilkan disk dengan nama model, kapasitas, dan status OS yang terdeteksi, contoh:
```
CT1000P3SSD8 (nvme0n1)   1.00 TB nvme   Currently installed: Windows
```
**Kalau masih gagal** ("No disks available" walau sudah lakukan langkah 1-7): ulangi langkah 6 lebih teliti (grep `/tmp/storage.log` untuk `nvme` lagi setelah reboot), karena kemungkinan masih ada 1 partisi lain dengan signature nyangkut yang belum ketemu.

## Setelah disk terdeteksi: pilih mode instalasi

- **"Share disk with other operating systems"** → pilih ini kalau mau dual/multi-boot, pakai free space yang tersedia, OS lain (Windows) tidak diutak-atik.
- **"Use entire disk"** → hapus SEMUA partisi termasuk OS lain. Hanya pilih kalau memang mau wipe total.
- **"Mount point assignment"** → untuk skema partisi manual/custom.

## Bonus: bersihkan UEFI boot menu dari entry OS lama

Entry lama (misal "Rocky Linux", "ubuntu") yang masih muncul di boot menu walau partisinya sudah dihapus itu tersimpan di **NVRAM firmware**, bukan di disk. Bersihkan dengan `efibootmgr` dari Linux live session:
```bash
sudo efibootmgr -v          # lihat semua entry + nomornya
sudo efibootmgr -b <XXXX> -B   # hapus entry tertentu (ganti XXXX dengan nomor Boot-nya)
```
⚠️ Jangan hapus entry **Windows Boot Manager**. Fedora akan otomatis bikin entry baru sendiri setelah instalasi selesai.

## Ringkasan urutan command yang paling sering dipakai

```bash
# 1. Diagnosa awal
lsblk
sudo parted -l
sudo blkid

# 2. Cek LVM lama
sudo vgs
sudo lvs
sudo vgremove -f <nama_vg>

# 3. Hapus partisi lama
sudo wipefs -a /dev/nvme0nXpN
sudo parted /dev/nvme0n1 rm N

# 4. Cek log storage kalau masih bermasalah
sudo grep -i "nvme" /tmp/storage.log | tail -100
sudo grep -iE "traceback|exception|error" /tmp/storage.log | tail -60

# 5. Bersihkan signature nyangkut di partisi tertentu
sudo blkid /dev/nvme0nXpN
sudo wipefs -n /dev/nvme0nXpN
sudo wipefs -a --force /dev/nvme0nXpN

# 6. Reboot total sebelum coba lagi
sudo systemctl reboot
```
