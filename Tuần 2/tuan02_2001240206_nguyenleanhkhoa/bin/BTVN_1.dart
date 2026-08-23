import 'dart:io';

import 'package:tuan02_2001240206_nguyenleanhkhoa/BTVN_1/QuanLyHoaDon.dart';

void main() {
  QuanLyHoaDon ql = QuanLyHoaDon();
  int chon = -1;

  do {
    print("\n====== QUẢN LÝ HÓA ĐƠN CÔNG TY ABC ======");
    print("1. Nhập danh sách hóa đơn");
    print("2. Xuất danh sách hóa đơn");
    print("3. Tính tổng thành tiền của tất cả hóa đơn");
    print("4. Tính tổng tiền trợ giá công ty đã hỗ trợ");
    print("5. Cho biết thông tin khách hàng mua nhiều nhất");
    print("6. Tổng số tiền chiết khấu đối với khách hàng công ty");
    print("7. Sắp xếp danh sách (tăng dần SL, nếu bằng giảm dần Thành tiền)");
    print("8. Tìm kiếm hóa đơn theo mã khách hàng");
    print("0. Thoát");
    stdout.write("Nhập lựa chọn của bạn: ");

    chon = int.tryParse(stdin.readLineSync() ?? "-1") ?? -1;

    switch (chon) {
      case 1:
        ql.nhapDanhSach();
        break;
      case 2:
        ql.xuatDanhSach();
        break;
      case 3:
        print("Tổng thành tiền của tất cả hóa đơn: ${ql.tongThanhTien()}");
        break;
      case 4:
        print("Tổng tiền trợ giá công ty đã hỗ trợ: ${ql.tongTienTroGia()}");
        break;
      case 5:
        ql.thongTinKhachHangMuaNhieuNhat();
        break;
      case 6:
        print(
          "Tổng tiền chiết khấu đối với khách hàng công ty: ${ql.tongChietKhauCongTy()}",
        );
        break;
      case 7:
        ql.sapXepHoaDon();
        ql.xuatDanhSach();
        break;
      case 8:
        stdout.write("Nhập mã khách hàng cần tìm (vd: KH0001): ");
        String ma = stdin.readLineSync() ?? "";
        ql.xuatHoaDonTheoMa(ma);
        break;
      case 0:
        print("Đã thoát chương trình.");
        break;
      default:
        print("Lựa chọn không hợp lệ!");
    }
  } while (chon != 0);
}
