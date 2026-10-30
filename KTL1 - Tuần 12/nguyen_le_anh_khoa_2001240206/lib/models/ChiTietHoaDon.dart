class ChiTietHoaDon {
  int id;
  int maHD;
  int maNS;
  int soLuong;
  double giaBan;

  ChiTietHoaDon({
    required this.id,
    required this.maHD,
    required this.maNS,
    required this.soLuong,
    required this.giaBan
  });

  Map<String,dynamic> toMap() {
    return {
      'id' : id,
      'maHD' : maHD,
      'maNS' : maNS,
      'soLuong' : soLuong,
      'giaBan' : giaBan
    };
  }

  factory ChiTietHoaDon.fromMap(Map<String,dynamic> maps) {
    return ChiTietHoaDon(
      id: maps['id'], 
      maHD: maps['maHD'], 
      maNS: maps['maNS'], 
      soLuong: maps['soLuong'], 
      giaBan: maps['giaBan']
    );
  }
}