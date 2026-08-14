import 'dart:io';
import 'dart:math';

import 'package:my_dart_01/BTTL_3.dart';

List<int> nhapDS_Random() {
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
    var ran = Random();
    tmp.add( 5 + ran.nextInt(100-5+1));
  }
  return tmp;
}

List<int> DSLe (List<int> obj){
  List<int> SoLe = [];
  obj.forEach((num) {
    if (num % 2 != 0)
      SoLe.add(num);
  });
  return SoLe;
}

List<int> DSChan (List<int> obj){
  List<int> SoChan = [];
  obj.forEach((num) {
    if (num % 2 == 0)
      SoChan.add(num);
  });
  return SoChan;
}

double trungBinhCong_SoLe (List<int> obj){
  List<int> SoLe = DSLe(obj);
  return tongPhanTuDanhSach(SoLe) / SoLe.length;
}

bool isDanhSachDoiXung(List<int> obj) {
  for (int i = 0; i < obj.length ~/ 2; i++) {
    if (obj[i] != obj[obj.length - i - 1]) {
      return false;
    }
  }
  return true;
}


bool isDanhSachTangDan (List<int> obj)
{
    for (int i = 0; i < obj.length - 1 ; i++)
    if (obj[i] > obj[i + 1])
      return false;
  return true;
}

int phanTuMaxDS (List<int> obj){
  int max = obj[0];
  obj.forEach((num)
  {
    if (num > max)
      max = num;
  });
  return max;
}

int phanTuMaxDS_Chan (List<int> obj){
  List<int> DS = DSChan(obj);
  return phanTuMaxDS(DS);
}

void xoaPhanTu(List<int> obj, int n) {
  if (obj.contains(n)) {
    obj.remove(n);
  } else {
    print("Không tìm thấy");
  }
}
