import 'dart:io';

import 'HoaDon.dart';

class KhachHangCaNhan extends HoaDon {
  double _khoangCach = 0;

  double get khoangCach => _khoangCach;
  set khoangCach(double value) {
    if (value >= 0) _khoangCach = value;
  }

  KhachHangCaNhan() : super();

  KhachHangCaNhan.full(
    String ma,
    String ten,
    int sl,
    int gia,
    double khoangCach,
  ) : super.full(ma, ten, sl, gia) {
    if (khoangCach >= 0) {
      _khoangCach = khoangCach;
    } else {
      throw Exception("Khoảng cách phải >= 0");
    }
  }

  @override
  void nhap() {
    super.nhap();
    while (true) {
      stdout.write("Nhập khoảng cách giao hàng (km): ");
      double? kc = double.tryParse(stdin.readLineSync() ?? "");
      if (kc != null && kc >= 0) {
        _khoangCach = kc;
        break;
      } else {
        print("Lỗi: Khoảng cách không hợp lệ. Vui lòng nhập lại!");
      }
    }
  }

  @override
  double chietKhau() {
    double ck = 0;
    if (soLuong >= 3) {
      ck = (giaBan * 0.05) * soLuong;
      if (_khoangCach < 10) {
        ck += 50000 * soLuong;
      }
    }
    return ck;
  }

  @override
  double troGia() {
    double troGiaTien = (giaBan * 0.02) * soLuong;
    if (soLuong > 2) {
      troGiaTien += 100000;
    }
    return troGiaTien;
  }

  @override
  String ghiChu() {
    return "KC: $_khoangCach km";
  }
}
