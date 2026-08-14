import 'dart:io';

import 'package:my_dart_01/BTTL_3.dart';
import 'package:my_dart_01/BTVN_1.dart';

void main(){
  List<int> arr = [];
  int? n;
  arr = nhapDS_Random();

  print("Xuất danh sách : ${arr}");
  print("Tổng các phần tử : ${tongPhanTuDanhSach(arr)}");
  print("Trung bình cộng các số lẻ : ${trungBinhCong_SoLe(arr) != 0 ? trungBinhCong_SoLe(arr) : "Danh sách không có số lẻ"}");
  print("Danh sách đối xứng : ${isDanhSachDoiXung(arr)}");
  print("Danh sách tăng dần : ${isDanhSachTangDan(arr)}");
  print("Phần tử lớn nhất : ${phanTuMaxDS(arr)}");
  print("Phần tử số chẵn lớn nhất : ${phanTuMaxDS_Chan(arr) == 0 ? phanTuMaxDS_Chan(arr) : "Danh sách không có số chẵn"}");
  do {
      stdout.write("Nhập số n : ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Nhập sai, vui lòng nhập lại");
        continue;
      }

      int? parsed = int.tryParse(input);
      if (parsed == null || (parsed < 5 && parsed > 100)) {
        print("Nhập sai, vui lòng nhập lại");
      } else {
        n = parsed; 
        xoaPhanTu(arr, n);
        print("${arr}");
      }
    } while (n == null);
}