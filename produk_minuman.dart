import 'produk.dart';
import 'diskon_mixin.dart';

class ProdukMinuman extends Produk with BisaDiskon {
  bool dingin;

  ProdukMinuman(String kode, String nama, double harga, int stok, this.dingin)
      : super (kode, nama, harga, stok);

  @override
  double hitungPajak() => harga * 0.06;

  @override
  double hitungHargaDiskon(double harga) {
    return harga * (1 - diskon/100);
  }
  
  @override
  String cetakStruk() => "$nama - dingin: ${dingin ? 'dingin' : 'tidak'}";
}