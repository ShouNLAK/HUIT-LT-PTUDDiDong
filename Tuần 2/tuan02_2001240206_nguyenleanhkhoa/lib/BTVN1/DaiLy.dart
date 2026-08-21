import 'package:tuan02_2001240206_nguyenleanhkhoa/BTVN1/HoaDon.dart';

class DaiLy extends HoaDon{
  late DateTime _thoiGianHopTac;
  DaiLy(String ma, String ten, int sl,int gia, DateTime tg) : super.full(ma, ten, sl, gia)
  {
    _thoiGianHopTac = tg;
  }
}