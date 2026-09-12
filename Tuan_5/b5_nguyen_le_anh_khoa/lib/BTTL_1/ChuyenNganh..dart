class ChuyenNganh {
  String _tenChuyenNganh;
  String _moTa;
  String _tenVietTat;

  ChuyenNganh({required this._tenChuyenNganh,required this._moTa, required this._tenVietTat});

  String get getTenChuyenNganh => _tenChuyenNganh;
  String get getMoTa => _moTa;
  String get getTenVietTat => _moTa;
}