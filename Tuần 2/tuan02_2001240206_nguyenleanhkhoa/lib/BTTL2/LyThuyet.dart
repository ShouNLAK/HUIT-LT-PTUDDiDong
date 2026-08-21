import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/MonHoc.dart';

class LyThuyet extends MonHoc {
  double _diemTieuLuan = 0;
  double _diemCuoiKy = 0;

  LyThuyet.full(String mamh, String tenmh, int sotc, double dtl, double dck)
      : super.full(mamh, tenmh, sotc) {
    _diemTieuLuan = dtl;
    _diemCuoiKy = dck;
  }

  @override
  double tinhDTB() => _diemTieuLuan * 0.3 + _diemCuoiKy * 0.7;
}