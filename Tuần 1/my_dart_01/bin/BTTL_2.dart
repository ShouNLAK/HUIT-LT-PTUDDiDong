import 'dart:io';

import 'package:my_dart_01/BTTL_2.dart';

void main(){
  int n = 0;
  do {
      stdout.write("Nhập số nguyên n > 10 : ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Nhập sai, vui lòng nhập lại");
        continue;
      }

      int? parsed = int.tryParse(input);
      if (parsed == null || parsed < 10) {
        print("Nhập sai, vui lòng nhập lại");
      } else {
        n = parsed; 
      }
    } while (n < 10);
  
  print("Số lượng chữ số : ${soLuongChuSo(n)}");
  print("Tổng các chữ số : ${tongChuSo(n)}");
  print("Có số lẻ ? : ${isLe(n) ? "Có" : "Không"}");
  print("Chữ số lớn nhất : ${layMax(n)}");
  List<int> arr = laySoNguyenTo(n);
  print("Có số nguyên tố ? : ${arr.isNotEmpty ? arr : "Không"}");
}