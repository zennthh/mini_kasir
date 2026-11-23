DAY 4 PRAKTIK — Control Flow + Functions

Implementasi map(), where(), fold(), dan callbacks ke KasirKu Mini:

Requirements:
Transaksi class:
Tambah method yang gunakan .where() untuk filter items berdasarkan kriteria
Tambah method yang gunakan .map() untuk transform items
Tambah method yang gunakan .fold() untuk aggregate (total harga, total pajak, dll)

Keranjang class:
Implement higher-order function (at least 1 dari map/where/fold)
Contoh: get total harga items, filter produk by kriteria, dll

Callbacks:
Minimal 1 method yang terima function sebagai parameter (callback)
Method dipanggil dengan anonymous function
Contoh: proses transaksi dengan callback untuk setiap item, atau print dengan custom formatter

Test di main.dart:
Test map() — transform data
Test where() — filter data
Test fold() — aggregate data
Test callback — panggil dengan anonymous function
Chain multiple operations (map → where → fold)