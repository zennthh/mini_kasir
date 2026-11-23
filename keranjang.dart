import 'produk.dart';
import 'transaksi.dart';

class Keranjang {
  List<Produk> isi = [];
  Map<String, int> jumlahProduk = {};

  void tambah(Produk produk, {int jumlah = 1}) {
    if (!jumlahProduk.containsKey(produk.kode)) {
      isi.add(produk);
    }
    jumlahProduk[produk.kode] = (jumlahProduk[produk.kode] ?? 0) + jumlah;
    // print('${produk.nama} ditambah ke keranjang (qty: $jumlah)');
  }

  Transaksi checkout() {
    if (isi.isEmpty) {
      throw Exception('Keranjang masih kocong tidak bisa checkout');
    }

    for(final produk in isi) {
      final jumlah = (jumlahProduk[produk.kode] ?? 0);
      if(jumlah > produk.stok) {
        throw Exception('Maaf stok tidak cukup');
      }
    }

    final transaksi = Transaksi('TRX${DateTime.now().millisecondsSinceEpoch}');

    for(final produk in isi) {
      final jumlah = (jumlahProduk[produk.kode] ?? 0);
      transaksi.tambahItem(produk, jumlah);
      produk.kurangiStok(jumlah);
    }
    kosongkan();
    return transaksi;
  }

  void tampilkanISi() {
    if (isi.isEmpty) {
      print('Keranjang kosong');
    }
    for (final p in isi) {
      final qty = jumlahProduk[p.kode] ?? 0;
      final subsTotal = p.harga * qty;

      print(
        ' - Isi keranjang saat ini: ${p.nama} - qty: ${qty} - total:${subsTotal}.',
      );
    }
  }

  void kosongkan() {
    isi.clear();
    jumlahProduk.clear();
  }
}
