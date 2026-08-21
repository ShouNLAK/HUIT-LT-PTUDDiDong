import 'package:tuan02_2001240206_nguyenleanhkhoa/BTHD2/NhanVien.dart';

class CanBo extends NhanVien {
  String _chucVu = '';
  double _hsChucVu = 0;
  CanBo() : super()
  {
    _chucVu = 'Unknown';
    _hsChucVu = 0;
  }
  CanBo.full(String manv, String tennv, double hsl, String pb, double songay, String chucvu, double hscv) :
    super.full(manv, tennv, hsl, pb, songay)
    {
      _chucVu = chucvu;
      _hsChucVu = hscv; 
    }
  @override
  String toString()
  {
    return super.toString() + '\t$_chucVu\t$_hsChucVu';
  }
  @override
  double tinhLuong()
  {
    return super.tinhLuong() + _hsChucVu*1100;
  }
}