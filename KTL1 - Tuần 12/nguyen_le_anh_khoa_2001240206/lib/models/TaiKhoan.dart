class TaiKhoan {
  String user;
  String pass;
  String hoVaTen;
  String soDienThoai;

  TaiKhoan({
    required this.user,
    required this.pass,
    required this.hoVaTen,
    required this.soDienThoai,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'pass': pass,
      'hoVaTen': hoVaTen,
      'soDienThoai': soDienThoai,
    };
  }

  factory TaiKhoan.fromMap(Map<String, dynamic> map) {
    return TaiKhoan(
      user: map['user'],
      pass: map['pass'],
      hoVaTen: map['hoVaTen'],
      soDienThoai: map['soDienThoai'],
    );
  }
}