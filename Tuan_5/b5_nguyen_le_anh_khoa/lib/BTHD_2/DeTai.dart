class DeTai { 
  String _maDeTai; 
  String _tenDeTai; 
  String _tenGiangVien; 
  String _noiDung; 
  String _chuyenNganh; 

  DeTai( {required String maDeTai, required String tenDeTai, required String tenGiangVien, 
  required String noiDung, required String chuyenNganh} ) 
  : _chuyenNganh = chuyenNganh, _noiDung = noiDung, _tenDeTai = tenDeTai, 
  _tenGiangVien = tenGiangVien, _maDeTai = maDeTai; 

  String get getMaDeTai => _maDeTai; 
  String get getTenDeTai => _tenDeTai; 
  String get getTenGiangVien => _tenGiangVien; 
  String get getNoiDung => _noiDung; 
  String get getChuyenNganh => _chuyenNganh; 
}