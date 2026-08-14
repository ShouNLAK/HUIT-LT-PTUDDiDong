import 'dart:io';

import 'package:my_dart_01/demo_02.dart';

List<int> nhapDS() {
  List<int> tmp = [];
  int n = 0;
  do {
    stdout.write("Nhập số lượng phần tử (>0): ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Nhập sai, vui lòng nhập lại");
      continue;
    }

    int? parsed = int.tryParse(input);
    if (parsed == null || parsed <= 0) {
      print("Nhập sai, vui lòng nhập lại");
    } else {
      n = parsed;
    }
  } while (n <= 0);
  for (int i = 0; i < n; i++) {
    while (true) {
      stdout.write("Nhập giá trị phần tử thứ $i : ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Nhập sai, vui lòng nhập lại");
        continue;
      }

      int? parsed = int.tryParse(input);
      if (parsed == null) {
        print("Nhập sai, vui lòng nhập lại");
      } else {
        tmp.add(parsed);
        break;
      }
    }
  }

  return tmp;
}


int tongPhanTuDanhSach(List<int> obj){
  int Tong = 0;
  obj.forEach((num){
    Tong += num;
  });
  return Tong;
}

List<int> PhanTuNguyenTo(List<int> obj){
  List<int> tmp = [];
  obj.forEach((num){
    if(checkPrime(num))
      tmp.add(num);
  });
  return tmp;
}

void timHoacThem(List<int> obj, int num){
  if (obj.any((n) => n == num))
    print("Phần tử tồn tại - Nằm ở vị trí ${obj.indexWhere((n) => n == num)}");
  else
    {
      obj.add(num);
      print("Phần tử không tồn tại - Đã thêm ở vị trí cuối : ${obj}");
    }
}