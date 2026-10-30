class HoaDon {
  int maHD;
  String user;
  DateTime ngayMua;
  double tongTien;

  HoaDon({
    required this.maHD,
    required this.user,
    required this.ngayMua,
    required this.tongTien
  });

  Map<String, dynamic> toMap() {
    return{
      'maHD' : maHD,
      'user' : user,
      'ngayMua' : ngayMua.toIso8601String(),
      'tongTien' : tongTien
    };
  }

  factory HoaDon.fromMap(Map<String,dynamic> maps) {
    return HoaDon(
      maHD: maps['maHD'], 
      user: maps['user'], 
      ngayMua: DateTime.parse(maps['ngayMua']), 
      tongTien: maps['tongTien']
      );
  }
}