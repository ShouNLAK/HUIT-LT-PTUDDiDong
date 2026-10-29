class TaiKhoan{
  String tenDangNhap;
  String matKhau;
  int doTuoi;
  bool gioiTinh;

TaiKhoan({
  required this.tenDangNhap,
  required this.matKhau,
  required this.doTuoi,
  required this.gioiTinh
});

  Map<String,dynamic> toMap(){
    return {
      'tenDangNhap' : tenDangNhap,
      'matKhau' : matKhau,
      'doTuoi' : doTuoi,
      'gioiTinh' : gioiTinh ? 1 : 0
    };
  }

  factory TaiKhoan.fromMap(Map<String,dynamic> maps) {
    return TaiKhoan(
      tenDangNhap: maps['tenDangNhap'], 
      matKhau: maps['matKhau'], 
      doTuoi: maps['doTuoi'], 
      gioiTinh: maps['gioiTinh'] == 1
      );
  }
}