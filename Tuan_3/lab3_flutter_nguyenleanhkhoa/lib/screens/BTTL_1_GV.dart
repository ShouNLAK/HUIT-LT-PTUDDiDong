import 'package:flutter/material.dart';

class BTTL1_GV extends StatelessWidget{
  const BTTL1_GV ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bài tập tại lớp #1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Thông tin giảng viên",
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Giảng viên : Trần Văn T",
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Khoa : Công nghệ Thông tin",
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
                child: Text("Học hàm : Thạc sỹ",
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
                child: Text("Chuyên ngành : Công nghệ phần mềm",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Giảng dạy : Nhập môn lập trình, Công nghệ .NET, Lập trình hướng...",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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