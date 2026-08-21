import 'dart:io';

import 'package:tuan02_2001240206_nguyenleanhkhoa/BTHD1-3/SanPham.dart';

void main()async
{
  List<SanPham> ds = await readFile('lib/BTHD1-3/sanpham.txt');
  print("Đọc dữ liệu từ file: ");
  for(SanPham sp in ds)
    sp.showInfo();
}

Future<List<SanPham>> readFile(String fileName) async{
  
  {
    List<SanPham> arr = [];
    try{
      List<String> lines = await File(fileName).readAsLines();
      for (String line in lines)
      {
        List<String> parts = line.split('#');
        if (parts.length == 4)
        {
          String maSP = parts[0].trim();
          String tenSP = parts[1].trim();
          double donGia = double.parse(parts[2].trim());
          double giamGia = double.parse(parts[3].trim());
          if(maSP != null && tenSP != null)
          {
            arr.add(SanPham.full(maSP, tenSP, donGia, giamGia));
          }
        }
      }
    } catch (e)
    {
      print("Lỗi khi đọc file : $e");
    }
    return arr;
  }
}