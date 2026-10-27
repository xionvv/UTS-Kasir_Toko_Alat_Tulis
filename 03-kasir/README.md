# UTS: 03 Kasir Toko Alat Tulis

Aplikasi console kasir sederhana: memilih barang, memasukkan ke keranjang, lalu membayar.

Sebagian fitur **sudah jadi**. Tugas kamu adalah **melanjutkan aplikasi ini** dengan membuat fitur yang belum tersedia.

## Ketentuan

- Dikerjakan **individu**.
- Pilih **minimal 3 fitur** dari daftar fitur pilihan di bawah. Tingkatnya bebas.
- Kerjakan di `fitur.dart`, pada fungsi yang bertanda `// TODO`. Hapus baris `print('Fitur belum tersedia.');` setelah fiturnya kamu buat.
- Kamu boleh menambah fungsi bantu sendiri.
- Hasilnya dipresentasikan di **pertemuan #8**: jalankan programnya, tunjukkan fitur yang kamu buat, dan jelaskan kodenya.

## Cara menjalankan

```bash
dart run main.dart
```

Data hanya disimpan di memori. Setelah program ditutup, data kembali seperti semula.

## Struktur file

| File | Isi |
| --- | --- |
| `main.dart` | Menu utama |
| `data.dart` | Data barang, keranjang, riwayat transaksi, dan aturan diskon |
| `input.dart` | Fungsi membaca input keyboard: `bacaTeks()`, `bacaInt()`, `bacaDouble()` |
| `fitur.dart` | Semua fitur. **Bagian yang kamu kerjakan ada di sini.** |

Keranjang disimpan sebagai `Map<String, int>`, yaitu kode barang → jumlah yang dibeli.

## Aturan diskon

- Total belanja ≥ Rp100.000 → diskon 10%
- Total belanja ≥ Rp50.000 → diskon 5%
- Selain itu tidak ada diskon

## Fitur yang sudah jadi

| Menu | Fitur | Fungsi |
| --- | --- | --- |
| 1 | Lihat daftar barang | `tampilkanBarang()` |
| 2 | Tambah barang ke keranjang (cek stok) | `tambahKeKeranjang()` |
| 3 | Lihat keranjang dan total | `tampilkanKeranjang()` |

Pelajari fitur ini dulu. Fungsi bantu `cariByKode()`, `hitungTotal()`, dan `cetakIsiKeranjang()` bisa kamu pakai lagi.

## Fitur pilihan

| No | Fitur | Tingkat | Fungsi | Catatan |
| --- | --- | --- | --- | --- |
| 1 | Tambah barang baru (menu 4) | Mudah | `tambahBarangBaru()` | |
| 2 | Hapus item dari keranjang (menu 5) | Mudah | `hapusDariKeranjang()` | |
| 3 | Diskon | Sedang | `hitungDiskon()` | Hasilnya terlihat di menu 3 |
| 4 | Pembayaran dan kembalian (menu 6) | Sedang | `bayar()` | |
| 5 | Stok berkurang setelah bayar | Sulit | `kurangiStok()` | **Butuh fitur 4** |
| 6 | Riwayat transaksi dan struk (menu 7) | Sulit | `simpanRiwayat()`, `tampilkanRiwayat()` | **Butuh fitur 4** |

Fitur 5 dan 6 dipanggil dari dalam `bayar()`. Jadi kalau kamu memilih salah satunya, fitur 4 juga harus dikerjakan, dan fitur 4 tetap dihitung sebagai salah satu pilihanmu.

### Fitur 1 — Tambah barang baru (Mudah)

Tolak jika kode sudah dipakai.

```
=== Tambah Barang Baru ===
Kode barang: B07
Nama barang: Stapler
Harga: 12000
Stok: 8
Barang Stapler berhasil ditambahkan.
```

### Fitur 2 — Hapus item dari keranjang (Mudah)

Contoh: keranjang berisi 3 Pulpen (B02) dan 2 Buku Tulis (B01).

```
=== Hapus dari Keranjang ===
Kode barang: B02
Barang B02 dihapus dari keranjang.
```

### Fitur 3 — Diskon (Sedang)

Isi fungsi `hitungDiskon(total)` agar mengembalikan potongan sesuai aturan diskon. Menu 3 sudah memanggil fungsi ini. Contoh dengan 1 Kalkulator dan 4 Buku Tulis:

```
=== Keranjang ===
B06 | Kalkulator | 1 x Rp75000 = Rp75000
B01 | Buku Tulis | 4 x Rp5000 = Rp20000
Total      : Rp95000
Diskon     : Rp4750
Total bayar: Rp90250
```

### Fitur 4 — Pembayaran dan kembalian (Sedang)

Buat fungsi `hitungKembalian(totalBayar, uang)` yang **melempar `Exception`** jika uang kurang. Tangkap dengan `try`-`catch` di `bayar()`. Jika berhasil, kosongkan keranjang. Contoh dengan keranjang yang sama (angkanya sudah memakai diskon dari fitur 3; tanpa fitur 3, total bayarnya Rp95000):

```
=== Pembayaran ===
Total bayar: Rp90250
Uang diterima: 50000
Pembayaran gagal. Exception: Uang kurang Rp40250.
```

```
=== Pembayaran ===
Total bayar: Rp90250
Uang diterima: 100000
Kembalian: Rp9750
Pembayaran berhasil.
```

### Fitur 5 — Stok berkurang setelah bayar (Sulit)

Setelah pembayaran di atas berhasil, stok Buku Tulis berkurang dari 20 menjadi 16, dan stok Kalkulator dari 5 menjadi 4 (menu 1):

```
=== Daftar Barang ===
B01 | Buku Tulis | Rp5000 | stok 16
B02 | Pulpen | Rp3000 | stok 50
B03 | Pensil | Rp2000 | stok 30
B04 | Penghapus | Rp1500 | stok 25
B05 | Map Plastik | Rp4000 | stok 10
B06 | Kalkulator | Rp75000 | stok 4
```

### Fitur 6 — Riwayat transaksi dan struk (Sulit)

Simpan setiap transaksi yang berhasil, lalu tampilkan semuanya di menu 7. Contoh setelah dua transaksi:

```
=== Riwayat Transaksi ===
--- Transaksi #1 ---
B06 | Kalkulator | 1 x Rp75000 = Rp75000
B01 | Buku Tulis | 4 x Rp5000 = Rp20000
Total      : Rp95000
Diskon     : Rp4750
Total bayar: Rp90250
Uang       : Rp100000
Kembalian  : Rp9750
--- Transaksi #2 ---
B02 | Pulpen | 3 x Rp3000 = Rp9000
Total      : Rp9000
Diskon     : Rp0
Total bayar: Rp9000
Uang       : Rp10000
Kembalian  : Rp1000
```

Petunjuk: isi keranjang harus **disalin** saat disimpan, karena keranjang dikosongkan setelah pembayaran.
