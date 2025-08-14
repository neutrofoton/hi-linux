#!/bin/bash

# ------------------------------------------------------
# Script ini menghapus nomor urut dan timestamp dari file .srt
# lalu menampilkan hanya teks subtitle di terminal
# Tanpa mengubah file asli
# ------------------------------------------------------

# Pastikan user memberikan nama file .srt sebagai argumen
if [ -z "$1" ]; then
    echo "Usage: $0 file.srt"
    exit 1
fi

# Proses file:
grep -vE '^[[:space:]]*[0-9]+[[:space:]]*$' "$1" | \
# ^ Hapus baris yang hanya berisi angka (nomor urut subtitle)
#   termasuk kalau ada spasi di awal/akhir baris

grep -vE '^[[:space:]]*[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3} --> ' | \
# ^ Hapus baris yang berisi timestamp (format jam --> jam)
#   termasuk kalau ada spasi di awal baris

sed '/^[[:space:]]*$/d'
# ^ Hapus baris kosong (baris yang hanya spasi atau benar-benar kosong)

# Catatan:
# - Pipeline ini memproses file di memori, tidak menyentuh file aslinya
# - Output langsung tampil di layar (stdout)
