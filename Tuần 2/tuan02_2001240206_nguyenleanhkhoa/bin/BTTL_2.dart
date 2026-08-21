import 'dart:io';

import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/BTTL2.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/MonHoc.dart';

void main() async {
  int? LuaChon;
  List<MonHoc> danhSach = [];
  do{
    HienThi();
    stdout.write("Nhập lựa chọn của bạn : ");
    LuaChon = int.parse(stdin.readLineSync() ?? "-1");
    switch (LuaChon){
      case 0:
        print("Thoát chương trình");
        break;
      case 1 :
        nhapTuBanPhim(danhSach);
        break;
      case 2: 
        xuatDanhSach(danhSach, 'Danh sách môn học hiện tại');
        break;
      case 3:
        kiemTraSapXepTheoTen(danhSach);
        break;
      case 4:
        danhSach.sort((a, b) => a.soTC.compareTo(b.soTC));
        xuatDanhSach(danhSach, 'Danh sách sau khi sắp xếp');
        break;
      case 5:
        inMonHocTinChiCaoNhat(danhSach);
        break;
      case 6:
        timVaThemMonHoc(danhSach);
        break;
      case 7:
        await docFile(danhSach, 'lib/BTTL2/MonHoc.txt');
        break;
      case 8:
        tinhTinChiTrungBinh(danhSach);
        break;
      default:
        print("Nhập sai chương trình - Vui lòng nhập lại");
        break;
    }
  } while (LuaChon != 0);  
  
}