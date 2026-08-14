import 'dart:io';

double giamGia(int soLuong){
  if (soLuong >= 10)
    return 0.9;
  if (soLuong >= 5)
    return 0.95;
  return 1;
}

void BTTL_1()
{
  stdout.write("Nhập số lượng que kem: ");
  String? sl = stdin.readLineSync();
  stdout.write("Nhập giá của 1 que kem: ");
  String? gia = stdin.readLineSync();
  if ((sl != null && sl.isNotEmpty && int.tryParse(sl) != null) &&
      (gia != null && gia.isNotEmpty && int.tryParse(gia) != null)) {
        
    int soLuong = int.parse(sl), giaBan = int.parse(gia), tong = soLuong * giaBan;
    print("Số lượng que kem : $soLuong | Giá tiền 1 que kem : $giaBan");
    print("Giá phải trả : ${tong * giamGia(soLuong)}");
  }

}