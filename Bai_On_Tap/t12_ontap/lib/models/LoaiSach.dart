class LoaiSach {
  int maLoai;
  String tenLoai;

  LoaiSach({
    required this.maLoai,
    required this.tenLoai
  });

  Map<String, dynamic> toMap() {
    return {
      'maLoai' : maLoai,
      'tenLoai' : tenLoai
    };
  }

  factory LoaiSach.fromMap(Map<String,dynamic> maps) {
    return LoaiSach(
        maLoai: maps['maLoai'], 
        tenLoai: maps['tenLoai']
        );
  }
}