int demNguyenAm(String s) {
  String nguyenAm = "aeiouAEIOU";
  int dem = 0;
  for (var chu in s.split('')) {
    if (nguyenAm.contains(chu)) dem++;
  }
  return dem;
}

int demTu(String s) {
  return s.trim().split(RegExp(r'\s+')).length;
}

bool isDoiXung(String s) {
  String doiXung = s.split('').reversed.join('');
  return s == doiXung;
}

String daoNguocTu(String s) {
  List<String> tu = s.trim().split(RegExp(r'\s+'));
  return tu.reversed.join(' ');
}
