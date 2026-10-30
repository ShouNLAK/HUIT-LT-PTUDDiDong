class LoaiNongSan{
  String maLoai;
  String tenLoai;

  LoaiNongSan({
    required this.maLoai,
    required this.tenLoai
  });

  Map<String,dynamic> toMap() {
    return {
      'maLoai' : maLoai,
      'tenLoai' : tenLoai
    };
  }

  factory LoaiNongSan.fromMap(Map<String,dynamic> maps) {
    return LoaiNongSan(
      maLoai: maps['maLoai'], 
      tenLoai: maps['tenLoai']
      );
  }
}