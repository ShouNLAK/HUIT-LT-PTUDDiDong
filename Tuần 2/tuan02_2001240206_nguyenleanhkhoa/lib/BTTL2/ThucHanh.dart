import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/MonHoc.dart';

class ThucHanh extends MonHoc {
  double _kt1 = 0, _kt2 = 0, _kt3 = 0;

  ThucHanh.full(String mamh, String tenmh, int sotc, double kt1, double kt2, double kt3)
      : super.full(mamh, tenmh, sotc) {
    _kt1 = kt1; _kt2 = kt2; _kt3 = kt3;
  }

  @override
  double tinhDTB() => (_kt1 + _kt2 + _kt3) / 3;
}