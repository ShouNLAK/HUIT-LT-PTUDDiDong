import 'package:tuan02_2001240206_nguyenleanhkhoa/BTVN1/HoaDon.dart';

class KhachHang extends HoaDon{
  double _khoangCach = 0;
  KhachHang (String ma, String ten, int sl, int gia, double khoangcach) : super.full(ma, ten, sl, gia)
  {
    _khoangCach = khoangcach;
  }
  
  @override
  double chietKhau(){
    if (SoLuong >= 3)
      {
        if (_khoangCach <= 10)
          return thanhTien() * 0.05 + 50000 * SoLuong;
        else
          return thanhTien() * 0.05;
      }
      return 0;
  }
}