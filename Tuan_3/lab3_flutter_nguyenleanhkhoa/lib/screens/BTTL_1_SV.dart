import 'package:flutter/material.dart';

class BTTL1_SV extends StatelessWidget{
  const BTTL1_SV ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bài tập tại lớp #1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Thông tin sinh viên",
          style: TextStyle(color: Colors.white, fontSize: 20),),
          backgroundColor: Colors.blue,
          leading: IconButton(icon: const Icon(Icons.home),
          onPressed: (){},),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center( 
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Họ và tên : Nguyễn Lê Anh Khoa",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("MSSV : 2001240206",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Lớp : 15DHTH02",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Khóa : 13 Đại học tin học",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Ngành : Công nghệ thông tin",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Trường : Đại học Công thương Thành phố Hồ Chí Minh",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              
              Center(
                child: SizedBox(
                  width: 200, height: 60,
                  child: TextButton(
                  child: const Text("Trở về"),
                  onPressed: () {}),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}