import 'package:flutter/material.dart';
import 'package:mini_kasir/models/item_transaksi.dart';
import 'package:mini_kasir/models/transaksi.dart';
import 'models/produk.dart';
import 'models/produk_makanan.dart';
import 'models/produk_minuman.dart';
import 'models/keranjang.dart';
import 'models/transaksi.dart';
// import 'models/item_transaksi.dart';
import 'models/kasir.dart';


void main() {
  // final produk = Produk('Mkn001', 'Nasi Goreng', 15000, 100);
  final produkMakanan = ProdukMakanan('Mkn002', 'Nasi Kebuli', 20000, 100, 200);
  final produkMinuman = ProdukMinuman('Mnm001', 'Es Teler', 8000, 100, true);

  // produk.hitungPajak();
  // produkMakanan.hitungPajak();
  // produkMinuman.hitungPajak();
  //
  // produk.hitungPajak();
  // produkMakanan.hitungPajak();
  // produkMinuman.hitungPajak();
  //
  // produk.diskon;
  // produk.hitungHargaDiskon(15000);

  produkMakanan.diskon = 20;
  produkMakanan.hitungHargaDiskon(20000);

  produkMinuman.diskon = 20;
  produkMinuman.hitungHargaDiskon(8000);

  // final cetak = produk.cetakStruk();
  final cetakMakanan = produkMakanan.cetakStruk();
  final cetakMinuman = produkMinuman.cetakStruk();

  final transaksi = Keranjang();
  transaksi.tambah(produkMakanan, jumlah: 3);
  final toJson = transaksi.checkout();
  print(toJson.toJSON);
}

