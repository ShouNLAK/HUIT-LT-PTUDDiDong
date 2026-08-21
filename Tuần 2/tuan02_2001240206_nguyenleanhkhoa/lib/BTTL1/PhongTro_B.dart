import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL1/PhongTro.dart';

class PhongTro_B extends PhongTro
{
  double _giatui = 0;
  int _soMay = 0;
  static int GCB = 2000;
  PhongTro_B(String ma, int nguoi, double dien, double nuoc, double giatui, int somay)
  :super.full(ma, nguoi, dien, nuoc)
  {
    _giatui = giatui;
    _soMay = somay;
  }
  @override double tinhTienPhong() {
    // TODO: implement tinhDienNuoc
    return GCB + super.tinhDienNuoc() + 5*_giatui + 100*_soMay;
  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString() + "Giặt ủi : $_giatui\t | Số máy : $_soMay\t";
  }
}