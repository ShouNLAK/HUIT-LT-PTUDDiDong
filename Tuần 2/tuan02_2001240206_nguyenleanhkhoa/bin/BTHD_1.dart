import 'package:tuan02_2001240206_nguyenleanhkhoa/BTHD1-3/SanPham.dart';

void main()
{
  SanPham sp = SanPham();
  sp.showInfo();
  SanPham sp1 = SanPham.full("SP001", "Samsung Galaxy Note 7", 7000000, 20000);
  sp1.showInfo();


  List<SanPham> lst_SP = [];
  SanPham sp2 = SanPham.full("SP002", "Samsung Galaxy Note 10", 20000000, 1500000);
  lst_SP.add(sp1);
  lst_SP.add(sp2);

  print("Danh sách sản phẩm : ");
  for (SanPham sp in lst_SP)
    sp.showInfo();
}