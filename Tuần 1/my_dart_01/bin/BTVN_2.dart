import 'dart:io';

import 'package:my_dart_01/BTVN_2.dart';

void main() {
  String? input;
  do{
    stdout.write("Nhập vào một chuỗi: ");
    input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Chuỗi rỗng");
      return;
    }
  } while(input == null);

  print("Chuỗi vừa nhập: $input");
  int demNgAm = demNguyenAm(input);
  print("Số lượng nguyên âm: $demNgAm");
  int soChu = demTu(input);
  print("Số lượng từ: $soChu");
  bool doiXung = isDoiXung(input);
  print("Chuỗi có đối xứng không? ${doiXung ? "Có" : "Không"}");
  String daoNguoc = daoNguocTu(input);
  print("Chuỗi đảo ngược từ: $daoNguoc");
}