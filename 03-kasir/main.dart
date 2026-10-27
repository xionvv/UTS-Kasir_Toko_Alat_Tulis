import 'fitur.dart';
import 'input.dart';

void main() {
  print('=== Kasir Toko Alat Tulis ===');
  var berjalan = true;

  while (berjalan) {
    print('');
    print('1. Lihat daftar barang');
    print('2. Tambah barang ke keranjang');
    print('3. Lihat keranjang dan total');
    print('4. Tambah barang baru          [Mudah]');
    print('5. Hapus item dari keranjang   [Mudah]');
    print('6. Bayar                       [Sedang]');
    print('7. Riwayat transaksi           [Sulit]');
    print('0. Keluar');

    final pilihan = bacaInt('Pilih menu', min: 0, max: 7);
    switch (pilihan) {
      case 1:
        tampilkanBarang();
      case 2:
        tambahKeKeranjang();
      case 3:
        tampilkanKeranjang();
      case 4:
        tambahBarangBaru();
      case 5:
        hapusDariKeranjang();
      case 6:
        bayar();
      case 7:
        tampilkanRiwayat();
      case 0:
        berjalan = false;
    }
  }

  print('Terima kasih.');
}
