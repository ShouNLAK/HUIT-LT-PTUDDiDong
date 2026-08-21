class PhongTro {
  String _maPhong = '';
  int _soNguoi = 0;
  double _soDien = 0;
  double _soNuoc = 0;
  int get SoNguoi => _soNguoi;
  double get SoDien => _soDien;
  
  PhongTro.full(String ma, int nguoi, double dien, double nuoc)
  {
    _maPhong = ma;
    _soNguoi = nguoi;
    _soDien = dien;
    _soNuoc = nuoc;
  }
  double tinhDienNuoc()
  {
    return 2*_soDien + 8*_soNguoi;
  }
  @override
  String toString()
  {
    return 'Mã phòng : $_maPhong\t | Số người : $_soNguoi\t | Số điện : $_soDien\t | Số nước : $_soNuoc\t | ';
  }
}