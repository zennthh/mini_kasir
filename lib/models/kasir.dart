import 'keranjang.dart';
import 'transaksi.dart';
// import 'produk.dart';

class Kasir {
  final String nama;

  Kasir(this.nama);

  Transaksi layani(Keranjang keranjang) {
    // print('Kasir ${nama} melayani checkout...');
    return keranjang.checkout();
  }
}