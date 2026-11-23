import 'produk.dart';
import 'bisa_dicetak.dart';
import 'diskon_mixin.dart';

class ProdukMakanan extends Produk implements BisaDicetak {
  int kalori;

  ProdukMakanan(String kode, String nama, double harga, int stok, this.kalori)
      : super(kode, nama, harga, stok);

  @override
  double hitungPajak() => harga * 0.10;

  @override
  String toString() {
    // TODO: implement toString
    return "$nama - kalori: $kalori";
  }

  @override
  String cetakStruk() => "Menu: $nama - Kalori:$kalori";

  @override
  double hitungHargaDiskon(double harga) {
    return harga * (1 - diskon / 100);
  }
}