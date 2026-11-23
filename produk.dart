import "bisa_dicetak.dart";
import 'diskon_mixin.dart';


abstract class Produk with BisaDiskon implements BisaDicetak {
  final String kode;
  final String nama;
  double _harga;
  int _stok;

  Produk(this.kode, this.nama, double h, this._stok)
      : _harga = h <= 0 ? throw ArgumentError('Harga tidak valid') : h;

  // encapulaption
  double get harga => _harga;

  int get stok => _stok;

  void kurangiStok(int jumlah) {
    if (jumlah > _stok) {
      throw ArgumentError("Stok tidak mencukupi");
    }
    _stok -= jumlah;
  }

  void tambahStok(int jumlah) {
    _stok += jumlah;
  }

  double hitungPajak() {
    return _harga * 0.05;
  }

  @override
  void cetakStruk() => print('$nama (Rp${_harga.toStringAsFixed(0)}) - pajak: ${this.hitungPajak().toStringAsFixed(0)}');

  @override
  String toString() {
    return '$nama (Rp$_harga) - Stok: $_stok';
  }
}