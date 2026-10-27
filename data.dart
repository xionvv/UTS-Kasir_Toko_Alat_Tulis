/// Aturan diskon: belanja >= batas mendapat potongan persen tertentu.
const int batasDiskonBesar = 100000;
const int persenDiskonBesar = 10;
const int batasDiskonKecil = 50000;
const int persenDiskonKecil = 5;

/// Data awal barang. Harga dalam rupiah.
final List<Map<String, dynamic>> daftarBarang = [
  {'kode': 'B01', 'nama': 'Buku Tulis', 'harga': 5000, 'stok': 20},
  {'kode': 'B02', 'nama': 'Pulpen', 'harga': 3000, 'stok': 50},
  {'kode': 'B03', 'nama': 'Pensil', 'harga': 2000, 'stok': 30},
  {'kode': 'B04', 'nama': 'Penghapus', 'harga': 1500, 'stok': 25},
  {'kode': 'B05', 'nama': 'Map Plastik', 'harga': 4000, 'stok': 10},
  {'kode': 'B06', 'nama': 'Kalkulator', 'harga': 75000, 'stok': 5},
];

/// Keranjang belanja: kode barang -> jumlah yang dibeli.
final Map<String, int> keranjang = {};

/// Riwayat transaksi yang sudah dibayar.
final List<Map<String, dynamic>> riwayatTransaksi = [];
