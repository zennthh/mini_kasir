import 'produk.dart';
import 'item_transaksi.dart';

class Transaksi {
  final String idTransaksi;
  final DateTime waktu = DateTime.now();
  final List<ItemTransaksi> _item = [];
  // List [[0]-ItemTransaksi:
  //           produk: Produk produk:
  //                   {instance of Produk}
  //           jumlah: 1
  // ]

  Transaksi(this.idTransaksi);

  // ItemTransaksi tambahItem(Produk produk, int jumlah) {
  //   final item = ItemTransaksi(produk, jumlah);
  //   _item.add(item);
  //   return item;
  // }

  void tambahItem(Produk produk, int jumlah) {
    final item = ItemTransaksi(produk, jumlah);
    _item.add(item);
  }

  List<ItemTransaksi> get items => List.unmodifiable(_item);

  double get totalHarga => _item.fold(0.0, (acc, curr) => acc + curr.subtotal);

  List<ItemTransaksi> cekKategori(Produk kategori) => (_item.where((item) => item.produk == kategori).toList());

  List<Map<String, dynamic>> get toJSON {
    return _item.map((item) => {
      'KODE': item.produk.kode,
      'NAMA': item.produk.nama,
      'QTY': item.jumlah,
      'HARGA': item.produk.harga,
      'Total harga': totalHarga,
    }).toList();
  }

  String cetakStruk() {
    final buffer = StringBuffer();
    buffer.writeln('=== STRUK TRANSAKSI ===');
    buffer.writeln('ID: $idTransaksi');
    buffer.writeln('Waktu: ${waktu.toIso8601String()}');
    buffer.writeln('---');

    for (final item in _item) {
      buffer.writeln(
        '${item.produk.nama} x${item.jumlah} = Rp${item.subtotal.toStringAsFixed(0)}',
      );
    }

    buffer.writeln('---');
    buffer.writeln('TOTAL: Rp${totalHarga.toStringAsFixed(0)}');

    return buffer.toString();
  }

  @override
  String toString() {
    return 'Transaksi(${idTransaksi}): Rp${totalHarga}';
  }
}
