class Sach{
  int maSach;
  String tenSach;

  Sach({
    required this.maSach,
    required this.tenSach
  });

  Map<String,dynamic> toMap() {
    return {
      'maSach' : maSach,
      'tenSach' : tenSach
    };
  }

  factory Sach.fromMap(Map<String,dynamic> maps) {
    return Sach(
      maSach: maps['maSach'], 
      tenSach: maps['tenSach']
      );
  }
}