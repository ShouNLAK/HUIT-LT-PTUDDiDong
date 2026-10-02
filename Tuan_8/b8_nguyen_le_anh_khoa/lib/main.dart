import 'package:b8_nguyen_le_anh_khoa/BTHD.dart';
import 'package:b8_nguyen_le_anh_khoa/BTTL_1.dart';
import 'package:b8_nguyen_le_anh_khoa/BTTL_2.dart';
import 'package:b8_nguyen_le_anh_khoa/BTTL_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main App')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Main App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BTHD()),
                  );
                },
                child: const Text('Bài tập hướng dẫn: Hiển thị Google Map và Marker', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BTTL_1()),
                  );
                },
                child: const Text('Bài 1: Hiển thị Google Map và Marker', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BTTL_2()),
                  );
                },
                child: const Text('Bài 2: Vẽ đường đi', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BTTL_3()),
                  );
                },
                child: const Text('Bài 3: Chọn điểm và chi tiết hành trình', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}