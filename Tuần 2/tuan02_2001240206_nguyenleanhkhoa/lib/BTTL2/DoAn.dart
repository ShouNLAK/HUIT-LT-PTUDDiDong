import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/MonHoc.dart';

class DoAn extends MonHoc {
  double _diemGVHD = 0, _diemGVPB = 0;

  DoAn.full(String mamh, String tenmh, int sotc, double gvhd, double gvpb)
      : super.full(mamh, tenmh, sotc) {
    _diemGVHD = gvhd; _diemGVPB = gvpb;
  }

  @override
  double tinhDTB() => (_diemGVHD + _diemGVPB) / 2;
}