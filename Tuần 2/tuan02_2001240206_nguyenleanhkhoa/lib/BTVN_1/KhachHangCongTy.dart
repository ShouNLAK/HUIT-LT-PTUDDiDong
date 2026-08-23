import 'dart:io';

import 'HoaDon.dart';

class KhachHangCongTy extends HoaDon {
  int _soLuongNhanVien = 0;

  int get soLuongNhanVien => _soLuongNhanVien;
  set soLuongNhanVien(int value) {
    if (value >= 0) _soLuongNhanVien = value;
  }

  KhachHangCongTy() : super();

  KhachHangCongTy.full(String ma, String ten, int sl, int gia, int slnv)
    : super.full(ma, ten, sl, gia) {
    if (slnv >= 0) {
      _soLuongNhanVien = slnv;
    } else {
      throw Exception("Số lượng nhân viên phải >= 0");
    }
  }

  @override
  void nhap() {
    super.nhap();
    while (true) {
      stdout.write("Nhập số lượng nhân viên: ");
      int? slnv = int.tryParse(stdin.readLineSync() ?? "");
      if (slnv != null && slnv >= 0) {
        _soLuongNhanVien = slnv;
        break;
      } else {
        print("Lỗi: Số lượng nhân viên không hợp lệ. Vui lòng nhập lại!");
      }
    }
  }

  @override
  double chietKhau() {
    double tongGiaBan = soLuong * giaBan.toDouble();
    if (_soLuongNhanVien > 5000) {
      return tongGiaBan * 0.07;
    } else if (_soLuongNhanVien > 1000) {
      return tongGiaBan * 0.05;
    }
    return 0;
  }

  @override
  double troGia() {
    return 120000.0 * soLuong;
  }

  @override
  String ghiChu() {
    return "NV: $_soLuongNhanVien";
  }
}
