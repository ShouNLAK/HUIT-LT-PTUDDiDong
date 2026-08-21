import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL1/PhongTro.dart';

class PhongTro_A extends PhongTro {
  int _soNguoiThan = 0;
  static int GCB = 1400; 
  PhongTro_A(String ma, int nguoi, double dien, double nuoc, int nguoithan)
  :super.full(ma, nguoi, dien, nuoc)
  {
    _soNguoiThan = nguoithan;
  }
  @override
  double tinhTienPhong() {
    return GCB + super.tinhDienNuoc() + 50* _soNguoiThan;
  }
  
  @override
  String toString()
  {
    return super.toString() + 'Số người thân : $_soNguoiThan\t';
  }
}