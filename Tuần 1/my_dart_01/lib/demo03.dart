void demo03()
{
  List<int> arrs = [10,20,30,40,50];
  for (int i = 0; i < arrs.length; i++){
    print("Phần tử thứ $i : ${arrs[i]}");
  }
   arrs.forEach((num) {
    print("Giá trị : $num");
   });
   for (var num in arrs){
    print("Số: $num");
   }
}