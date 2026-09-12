import 'package:b5_nguyen_le_anh_khoa/BTHD_1.dart';
import 'package:b5_nguyen_le_anh_khoa/BTHD_2/BTHD_2.dart';
import 'package:b5_nguyen_le_anh_khoa/BTHD_3/BTHD_3.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_1/BTTL_1.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_2/BTTL_2.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_3/BTTL_3.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/IntroScreen.dart' as btvn1;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
          "Menu Bài Tập Tuần 5",
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
                      MaterialPageRoute(builder: (context) => const BTHD_3()),
                    );
                  },
                  child: const Text("Bài Thực Hành Hướng Dẫn #3"),
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
                      MaterialPageRoute(builder: (context) => const btvn1.IntroScreen()),
                    );
                  },
                  child: const Text("Bài Tập Về Nhà #4"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
