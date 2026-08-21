import 'dart:async';
import 'dart:io';

import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL1/PhongTro.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL1/PhongTro_A.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL1/PhongTro_B.dart';

void main() async{
  List<PhongTro>DS_Phong = await readFile('lib/BTTL1/phongthue.txt');
  print('Danh sách các phòng : ');
  for (var phong in DS_Phong)
    print (phong);

  List<PhongTro> DS_Phong_LonHon2 = DS_Phong.where((o) => o.SoNguoi > 2).toList();
  print('Danh sách các phòng có người thuê lớn hơn 2 : ');
  for(var phong in DS_Phong_LonHon2)
    print(phong);

  print("Tổng tiền phòng : ${tongTien(DS_Phong)}");

  print('Danh sách phòng thuê theo số điện giảm dần:');
  DS_Phong.sort((a, b) => b.SoDien.compareTo(a.SoDien));
  for (var phong in DS_Phong) {
    print(phong);
  }

  print('Danh sách các phòng loại A :');
  for(var phong in DS_Phong)
    if (phong is PhongTro_A)
      print(phong);

}

Future<List<PhongTro>> readFile(String fileName) async{
  
  {
    List<PhongTro> arr = [];
    try{
      List<String> lines = await File(fileName).readAsLines();
      for (String line in lines)
      {
        List<String> parts = line.split('#');
          String ma = parts[0].trim();
          int soNguoi = int.parse(parts[1].trim());
          double dien = double.parse(parts[2].trim());
          double nuoc = double.parse(parts[3].trim());
          if (ma.startsWith('A'))
          {
            int nguoithan = int.parse(parts[4].trim());
            arr.add(PhongTro_A(ma, soNguoi, dien, nuoc, nguoithan));
          }
          else if (ma.startsWith('B'))
          {
            double giatui = double.parse(parts[4].trim());
            int somay = int.parse(parts[5].trim());
            arr.add(PhongTro_B(ma, soNguoi, dien, nuoc, giatui, somay));
          }
        }
      } catch (e)
    {
      print("Lỗi khi đọc file : $e");
    }
    return arr;
  }
}

double tongTien (List<PhongTro> lst)
{
  double sum = 0;
  for (PhongTro phong in lst)
    if (phong is PhongTro_A)
      sum += phong.tinhTienPhong();
    else if (phong is PhongTro_B)
      sum += phong.tinhTienPhong();
  return sum;
}

