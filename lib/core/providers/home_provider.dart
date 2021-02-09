import 'package:flutter/foundation.dart';
import 'package:flutter_absensi/core/models/absensi.dart';
import 'package:flutter_absensi/core/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  List<Absensi> _presensi = [
    Absensi(
        id: '1',
        tanggal: '01-01-2021',
        lokasi: 'jln. Gayungan No 4 Banyuwangi',
        status: 1,
        waktu: '06:30'),
    Absensi(
        id: '2',
        tanggal: '01-01-2021',
        lokasi: 'jln. Gayungan No 4 Banyuwangi',
        status: 2,
        waktu: '16:30'),
  ];

  List<Absensi> get presensi => _presensi;

  void addAbsensi() {
    var absensi = Absensi(
        id: '2',
        tanggal: '01-01-2021',
        lokasi: 'jln. Gayungan No 4 Surabaya',
        status: 2,
        waktu: '16:30');
    _presensi.add(absensi);
    notifyListeners();
  }
}
