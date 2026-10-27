import 'dart:io';

/// Membaca satu baris teks dari keyboard.
///
/// Diulang sampai input tidak kosong. Program berhenti jika input habis
/// (misalnya saat input dikirim lewat pipe).
String bacaTeks(String label) {
  while (true) {
    stdout.write('$label: ');
    final String? baris = stdin.readLineSync();
    if (baris == null) {
      print('\nInput habis, program berhenti.');
      exit(0);
    }
    final teks = baris.trim();
    if (teks.isNotEmpty) return teks;
    print('Input tidak boleh kosong.');
  }
}

/// Membaca bilangan bulat antara [min] dan [max].
///
/// Diulang sampai input berupa angka yang valid.
int bacaInt(String label, {int min = 0, int max = 1000000000}) {
  while (true) {
    final teks = bacaTeks(label);
    try {
      final angka = int.parse(teks);
      if (angka >= min && angka <= max) return angka;
      print('$label harus antara $min dan $max.');
    } on FormatException {
      print('$label harus berupa angka bulat.');
    }
  }
}

/// Membaca bilangan desimal antara [min] dan [max].
double bacaDouble(String label, {double min = 0, double max = 1000000000}) {
  while (true) {
    final teks = bacaTeks(label);
    try {
      final angka = double.parse(teks);
      if (angka >= min && angka <= max) return angka;
      print('$label harus antara $min dan $max.');
    } on FormatException {
      print('$label harus berupa angka.');
    }
  }
}
