import 'dart:io';

abstract class HoaDon {
  String _maKH = '';
  String _tenKH = '';
  int _soLuong = 0;
  int _giaBan = 0;

  String get maKH => _maKH;
  set maKH(String value) {
    if (value.length == 6 &&
        value.startsWith('KH') &&
        int.tryParse(value.substring(2)) != null) {
      _maKH = value;
    } else {
      print(
        "Lỗi: Mã khách hàng phải có 6 kí tự, bắt đầu bằng 'KH' và 4 kí số (vd: KH0002).",
      );
    }
  }

  String get tenKH => _tenKH;
  set tenKH(String value) {
    if (value.trim().isNotEmpty) {
      _tenKH = value.trim();
    } else {
      print("Lỗi: Tên khách hàng không được để trống.");
    }
  }

  int get soLuong => _soLuong;
  set soLuong(int value) {
    if (value > 0) {
      _soLuong = value;
    } else {
      print("Lỗi: Số lượng phải > 0.");
    }
  }

  int get giaBan => _giaBan;
  set giaBan(int value) {
    if (value > 0) {
      _giaBan = value;
    } else {
      print("Lỗi: Giá bán phải > 0.");
    }
  }

  HoaDon() {
    _maKH = "KH0000";
    _tenKH = "Chưa có tên";
    _soLuong = 1;
    _giaBan = 1;
  }

  HoaDon.full(String ma, String ten, int sl, int gia) {
    if (ma.length == 6 &&
        ma.startsWith('KH') &&
        int.tryParse(ma.substring(2)) != null) {
      _maKH = ma;
    } else {
      throw Exception("Mã khách hàng sai định dạng");
    }
    if (ten.trim().isNotEmpty)
      _tenKH = ten.trim();
    else
      throw Exception("Tên khách hàng không được để trống");
    if (sl > 0)
      _soLuong = sl;
    else
      throw Exception("Số lượng phải > 0");
    if (gia > 0)
      _giaBan = gia;
    else
      throw Exception("Giá bán phải > 0");
  }

  void nhap() {
    while (true) {
      stdout.write("Nhập mã khách hàng (vd: KH0001): ");
      String ma = stdin.readLineSync() ?? "";
      if (ma.length == 6 &&
          ma.startsWith('KH') &&
          int.tryParse(ma.substring(2)) != null) {
        _maKH = ma;
        break;
      } else {
        print("Lỗi định dạng. Vui lòng nhập lại!");
      }
    }

    while (true) {
      stdout.write("Nhập tên khách hàng: ");
      String ten = stdin.readLineSync() ?? "";
      if (ten.trim().isNotEmpty) {
        _tenKH = ten.trim();
        break;
      } else {
        print("Lỗi: Tên không được để trống. Vui lòng nhập lại!");
      }
    }

    while (true) {
      stdout.write("Nhập số lượng: ");
      int? sl = int.tryParse(stdin.readLineSync() ?? "");
      if (sl != null && sl > 0) {
        _soLuong = sl;
        break;
      } else {
        print("Lỗi: Số lượng phải > 0. Vui lòng nhập lại!");
      }
    }

    while (true) {
      stdout.write("Nhập giá bán: ");
      int? gia = int.tryParse(stdin.readLineSync() ?? "");
      if (gia != null && gia > 0) {
        _giaBan = gia;
        break;
      } else {
        print("Lỗi: Giá bán phải > 0. Vui lòng nhập lại!");
      }
    }
  }

  double chietKhau();

  double tinhThueVAT() {
    return 0.1 * _soLuong * _giaBan;
  }

  double troGia() {
    return 0;
  }

  double thanhTien() {
    double tt = _soLuong * _giaBan - chietKhau() + tinhThueVAT();
    return tt > 0 ? tt : 0;
  }

  String ghiChu() {
    return "";
  }

  void xuat() {
    String m = _maKH.padRight(6);
    String t = _tenKH.length > 20 ? _tenKH.substring(0, 17) + '...' : _tenKH.padRight(20);
    String sl = _soLuong.toString().padRight(8);
    String gb = _giaBan.toString().padRight(12);
    String vat = tinhThueVAT().toString().padRight(10);
    String ck = chietKhau().toString().padRight(10);
    String tg = troGia().toString().padRight(10);
    String tt = thanhTien().toString().padRight(12);
    String gc = ghiChu().length > 25 ? ghiChu().substring(0, 22) + '...' : ghiChu().padRight(25);

    print("| $m | $t | $sl | $gb | $vat | $ck | $tg | $tt | $gc |");
  }
}
