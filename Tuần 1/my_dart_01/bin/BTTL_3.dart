import 'dart:io';

import 'package:my_dart_01/BTTL_2.dart';
import 'package:my_dart_01/BTTL_3.dart';

void main(){
  List<int> arr = [];
  int? n;
  arr = nhapDS();

  print("Xuất danh sách : $arr");
  print("Tổng các phần tử : ${tongPhanTuDanhSach(arr)}");
  print("Các phần tử là số nguyên tố : ${PhanTuNguyenTo(arr)}");
  do {
      stdout.write("Nhập số n : ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Nhập sai, vui lòng nhập lại");
        continue;
      }

      int? parsed = int.tryParse(input);
      if (parsed == null) {
        print("Nhập sai, vui lòng nhập lại");
      } else {
        n = parsed; 
        timHoacThem(arr, n);
      }
    } while (n == null);
}