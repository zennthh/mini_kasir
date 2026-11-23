import 'produk.dart';

mixin BisaDiskon {
  double diskon = 0.0;
  double hitungHargaDiskon(double harga) {
    return harga * (1 - diskon/100);
  }
}