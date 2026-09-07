import 'package:flutter/material.dart';
import 'package:tuan4_nguyenleanhkhoa/BTHD_1.dart';
import 'package:tuan4_nguyenleanhkhoa/BTHD_2.dart';
import 'package:tuan4_nguyenleanhkhoa/BTTL_3.dart';
import 'package:tuan4_nguyenleanhkhoa/BTTL_1.dart';
import 'package:tuan4_nguyenleanhkhoa/BTTL_2.dart';
import 'package:tuan4_nguyenleanhkhoa/BTVN_4.dart';
import 'package:tuan4_nguyenleanhkhoa/BTVN_5.dart';
import 'package:tuan4_nguyenleanhkhoa/BTVN_6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu Bài Tập Tuần 4",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTHD_1()),
                    );
                  },
                  child: const Text("Bài Thực Hành Hướng Dẫn #1"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTHD_2()),
                    );
                  },
                  child: const Text("Bài Thực Hành Hướng Dẫn #2"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTTL_1()),
                    );
                  },
                  child: const Text("Bài Thực Hành Tại Lớp #1"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTTL_2()),
                    );
                  },
                  child: const Text("Bài Thực Hành Tại Lớp #2"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTTL_3()),
                    );
                  },
                  child: const Text("Bài Thực Hành Tại Lớp #3"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTVN_4()),
                    );
                  },
                  child: const Text("Bài Tập Về Nhà 4"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTVN_5()),
                    );
                  },
                  child: const Text("Bài Tập Về Nhà 5"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BTVN_6()),
                    );
                  },
                  child: const Text("Bài Tập Về Nhà 6"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
