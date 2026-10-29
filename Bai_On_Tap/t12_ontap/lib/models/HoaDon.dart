class HoaDon {
  int maHD;
  String tenDangNhap;
  DateTime ngayMua;
  double tongTien;

  HoaDon({
    required this.maHD,
    required this.tenDangNhap,
    required this.ngayMua,
    required this.tongTien
  });

  Map<String, dynamic> toMap() {
    return {
      'maHD' : maHD,
      'tenDangNhap' : tenDangNhap,
      'ngayMua' : ngayMua.toIso8601String(),
      'tongTien' : tongTien
    };
  }

  factory HoaDon.fromMap(Map<String,dynamic> maps) {
    return HoaDon(  
      maHD: maps['maHD'], 
      tenDangNhap: maps['tenDangNhap'], 
      ngayMua: DateTime.parse(maps['ngayMua']), 
      tongTien: maps['tongTien']
      );
  }
}