import 'package:my_dart_01/demo_02.dart';

int soLuongChuSo(int number)
{
  int dem = 0, tmp = number;
  while(tmp != 0){
    tmp ~/= 10;
    dem ++;
  }
  return dem;
}

int tongChuSo (int number){
  int tong = 0, tmp = number;
  while (tmp != 0){
    tong += tmp % 10;
    tmp ~/= 10;
  }
  return tong;
}

bool isLe (int number)
{
  int tmp = number;
  while (tmp != 0)
  {
    if ((tmp % 10) % 2 != 0) {
      return true;
    }
    tmp ~/= 10;
  }
  return false;
}

int layMax (int number){
  int tmp = number, max = 0;
  while (tmp != 0)
  {
    if (tmp % 10 > max) {
      max = tmp % 10;
    }
    tmp ~/= 10;
  }
  return max;
}

List<int> laySoNguyenTo (int number)
{
  int tmp = number;
  List<int> arr = [];
  while (tmp != 0){
    int get = tmp % 10;
    if (checkPrime(get)){
      arr.add(get);
    }
    tmp ~/= 10;
  }
  return arr;
}