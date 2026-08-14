import 'dart:io';
bool checkPrime(int x) {
  if (x < 2) return false;
  for (int k = 2; k < x; k++)
  {
    if (x % k == 0) return false;
  }
  return true;
}

void demo02(){
  stdout.write("Nhập một số nguyên: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty)
  {
    print("Bạn đã nhập: $input");
    int number = int.parse(input);
    if(checkPrime(number)){
      print("$number là số nguyên tố.");
    } else
    {
      print("$number không là số nguyên tố.");
    }
  } else
  {
    print("Không có dữ liệu nhập vào");
  }
}