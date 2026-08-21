abstract class MonHoc {
  String _maMH = '';
  String _tenMH = '';
  int _soTC = 0;

  MonHoc.full(String mamh, String tenmh, int sotc) {
    _maMH = mamh;
    _tenMH = tenmh;
    _soTC = sotc;
  }

  String get maMH => _maMH;
  String get tenMH => _tenMH;
  int get soTC => _soTC;

  double tinhDTB();

  String diemChu(){
    if (tinhDTB() > 8.5)
      return 'A';
    if (tinhDTB() > 7)
      return 'B';
    if (tinhDTB() > 5)
      return 'C';
    if (tinhDTB() > 4)
      return 'D';
    return 'F';
  }
  
  void showInfo() {
    print("Mã: $_maMH | Tên: $_tenMH | TC: $_soTC | ĐTB: ${tinhDTB().toStringAsFixed(2)} | Điểm chữ : ${diemChu()}");
  }
}