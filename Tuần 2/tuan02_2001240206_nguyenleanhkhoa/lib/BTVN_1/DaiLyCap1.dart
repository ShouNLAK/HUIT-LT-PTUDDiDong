import 'dart:io';

import 'HoaDon.dart';

class DaiLyCap1 extends HoaDon {
  int _thoiGianHopTac = 0;

  int get thoiGianHopTac => _thoiGianHopTac;
  set thoiGianHopTac(int value) {
    if (value >= 0) _thoiGianHopTac = value;
  }

  DaiLyCap1() : super();

  DaiLyCap1.full(String ma, String ten, int sl, int gia, int tg)
    : super.full(ma, ten, sl, gia) {
    if (tg >= 0) {
      _thoiGianHopTac = tg;
    } else {
      throw Exception("Thời gian hợp tác phải >= 0");
    }
  }

  @override
  void nhap() {
    super.nhap();
    while (true) {
      stdout.write("Nhập thời gian hợp tác (năm): ");
      int? tg = int.tryParse(stdin.readLineSync() ?? "");
      if (tg != null && tg >= 0) {
        _thoiGianHopTac = tg;
        break;
      } else {
        print("Lỗi: Thời gian không hợp lệ. Vui lòng nhập lại!");
      }
    }
  }

  @override
  double chietKhau() {
    double tongGiaBan = soLuong * giaBan.toDouble();
    double phanTram = 30;
    if (_thoiGianHopTac > 5) {
      phanTram += (_thoiGianHopTac - 5) * 1.0;
      if (phanTram > 35) {
        phanTram = 35;
      }
    }
    return tongGiaBan * (phanTram / 100.0);
  }

  @override
  String ghiChu() {
    return "HT: $_thoiGianHopTac năm";
  }
}
