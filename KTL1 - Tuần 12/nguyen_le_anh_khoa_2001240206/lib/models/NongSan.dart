class NongSan{
  String maNS;
  String tenNS;
  String maLoai;
  double giaBan;
  String donViTinh;
  String moTa;
  String hinhAnh; 

  NongSan({
    required this.maNS,
    required this.tenNS,
    required this.maLoai,
    required this.giaBan,
    required this.donViTinh,
    required this.moTa,
    required this.hinhAnh,
  });

  Map<String,dynamic> toMap() {
    return{
      'maNS': maNS,
      'tenNS': tenNS,
      'maLoai' : maLoai,
      'giaBan' : giaBan,
      'donViTinh' : donViTinh,
      'moTa' : moTa,
      'hinhAnh' : hinhAnh
    };
  }

  factory NongSan.fromMap(Map<String,dynamic> maps) {
    return NongSan(
      maNS: maps['maNS'], 
      tenNS: maps['tenNS'], 
      maLoai: maps['maLoai'], 
      giaBan: maps['giaBan'], 
      donViTinh: maps['donViTinh'], 
      moTa: maps['moTa'], 
      hinhAnh: maps['hinhAnh']
    );
  }
}