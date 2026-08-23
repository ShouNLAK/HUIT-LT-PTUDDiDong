import 'dart:io';

import 'HoaDon.dart';
import 'KhachHangCaNhan.dart';
import 'DaiLyCap1.dart';
import 'KhachHangCongTy.dart';

class QuanLyHoaDon {
  List<HoaDon> dsHoaDon = [];

  void inDuongKe() {
    print("-" * 137);
  }

  void inTieuDe() {
    inDuongKe();
    print("| ${'Mã KH'.padRight(6)} | ${'Tên Khách Hàng'.padRight(20)} | ${'Số lượng'.padRight(8)} | ${'Giá bán'.padRight(12)} | ${'Thuế VAT'.padRight(10)} | ${'Chiết khấu'.padRight(10)} | ${'Trợ giá'.padRight(10)} | ${'Thành tiền'.padRight(12)} | ${'Ghi chú'.padRight(25)} |");
    inDuongKe();
  }

  void nhapDanhSach() {
    stdout.write("Nhập số lượng hóa đơn cần thêm: ");
    int n = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    for (int i = 0; i < n; i++) {
      print("\nNhập thông tin hóa đơn thứ ${i + 1}:");
      print("1. Khách hàng cá nhân");
      print("2. Đại lý cấp 1");
      print("3. Khách hàng công ty");
      stdout.write("Chọn loại khách hàng (1-3): ");
      String loai = stdin.readLineSync() ?? "";

      HoaDon hd;
      if (loai == '1') {
        hd = KhachHangCaNhan();
      } else if (loai == '2') {
        hd = DaiLyCap1();
      } else if (loai == '3') {
        hd = KhachHangCongTy();
      } else {
        print("Lựa chọn không hợp lệ. Bỏ qua hóa đơn này.");
        continue;
      }
      hd.nhap();
      dsHoaDon.add(hd);
    }
  }

  void xuatDanhSach() {
    if (dsHoaDon.isEmpty) {
      print("Danh sách hóa đơn trống.");
      return;
    }
    inTieuDe();
    for (var hd in dsHoaDon) {
      hd.xuat();
    }
    inDuongKe();
  }

  double tongThanhTien() {
    double tong = 0;
    for (var hd in dsHoaDon) {
      tong += hd.thanhTien();
    }
    return tong;
  }

  double tongTienTroGia() {
    double tong = 0;
    for (var hd in dsHoaDon) {
      tong += hd.troGia();
    }
    return tong;
  }

  void thongTinKhachHangMuaNhieuNhat() {
    if (dsHoaDon.isEmpty) {
      print("Danh sách rỗng.");
      return;
    }
    int maxSL = dsHoaDon[0].soLuong;
    for (var hd in dsHoaDon) {
      if (hd.soLuong > maxSL) {
        maxSL = hd.soLuong;
      }
    }

    print("--- Khách hàng có số lượng mua nhiều nhất ---");
    inTieuDe();
    for (var hd in dsHoaDon) {
      if (hd.soLuong == maxSL) {
        hd.xuat();
      }
    }
    inDuongKe();
  }

  double tongChietKhauCongTy() {
    double tong = 0;
    for (var hd in dsHoaDon) {
      if (hd is KhachHangCongTy) {
        tong += hd.chietKhau();
      }
    }
    return tong;
  }

  void sapXepHoaDon() {
    if (dsHoaDon.isEmpty) {
      print("Danh sách rỗng.");
      return;
    }
    dsHoaDon.sort((a, b) {
      int cmpSL = a.soLuong.compareTo(b.soLuong);
      if (cmpSL != 0) {
        return cmpSL;
      } else {
        return b.thanhTien().compareTo(
          a.thanhTien(),
        );
      }
    });
    print(
      "Đã sắp xếp danh sách (Tăng dần theo số lượng, nếu bằng giảm dần theo thành tiền).",
    );
  }

  void xuatHoaDonTheoMa(String ma) {
    bool found = false;
    for (var hd in dsHoaDon) {
      if (hd.maKH == ma) {
        if (!found) {
          inTieuDe();
          found = true;
        }
        hd.xuat();
      }
    }
    if (found) {
      inDuongKe();
    } else {
      print("Khách hàng lạ");
    }
  }
}
