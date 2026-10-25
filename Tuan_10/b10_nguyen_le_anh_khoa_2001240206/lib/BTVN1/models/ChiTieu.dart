class ChiTieu {
  final int? id;
  final String noiDungChiTieu;
  int soTien;
  String ghiChu;

  ChiTieu({this.id, required this.noiDungChiTieu, required this.soTien, required this.ghiChu});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'noiDungChiTieu': noiDungChiTieu,
      'soTien': soTien,
      'ghiChu': ghiChu,
    };
  }

  factory ChiTieu.fromMap(Map<String, dynamic> map) {
    return ChiTieu(
      id: map['id'],
      noiDungChiTieu: map['noiDungChiTieu'],
      soTien: map['soTien'],
      ghiChu: map['ghiChu'],
    );
  }
}
