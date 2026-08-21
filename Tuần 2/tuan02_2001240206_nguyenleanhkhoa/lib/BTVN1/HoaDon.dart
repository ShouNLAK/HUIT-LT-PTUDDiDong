abstract class HoaDon{
  String _maKH = '';
  String _tenKH = '';
  int _soLuong = 0;
  int _giaBan = 0;
  int get SoLuong => _soLuong;
  HoaDon.full(String ma, String ten, int sl, int gia)
  {
    _maKH = ma;
    _tenKH = ten;
    _soLuong = sl;
    _giaBan = gia;
  }
  double tongTien(){
    return thanhTien() + ( 0.1 * thanhTien()) - chietKhau();
  }
  int thanhTien(){
    return _soLuong * _giaBan;
  }

  double chietKhau();
}