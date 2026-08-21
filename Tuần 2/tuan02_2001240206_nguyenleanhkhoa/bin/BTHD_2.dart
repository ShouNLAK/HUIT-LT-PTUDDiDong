import 'package:tuan02_2001240206_nguyenleanhkhoa/BTHD2/CanBo.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTHD2/NhanVien.dart';

void main()
{
  NhanVien nv1 = NhanVien.full("NV001", "Nguyễn Trần Tuấn", 2.34, "Tổ chức", 23);
  CanBo cb2 = CanBo.full("NV002", "Trần Văn Bình", 2.34, "Tổ chức", 26, "Trưởng phòng", 2.0);
  NhanVien nv3 = NhanVien.full("NV003", "Nguyễn Nam", 2.34, "Nhân sự", 27);
  List<NhanVien> lst_NV = [];
  lst_NV.add(nv1);
  lst_NV.add(cb2);
  lst_NV.add(nv3);
  print("Danh sách nhân viên và cán bộ");
  for (var nv in lst_NV)
    print(nv);
  List<NhanVien> lst_NV_A = lst_NV.where((a) => a.xepLoai() == 'A').toList();
  print("Danh sách nhân viên xếp loại A");
  for (var nv in lst_NV_A)
    print(nv);
}