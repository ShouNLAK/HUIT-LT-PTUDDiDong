import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD/BTHD.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD_2/BTHD_2.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTTL2/BTTL2.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTVN/BTVN.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHomePage(),
    );
  }
}
class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuần 9 - Notifications & Local Storage'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'DANH SÁCH BÀI TẬP TUẦN 9',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenNotiEx()),
                  );
                },
                child: const Text(
                  'Bài tập hướng dẫn 1 (Notification)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenTodo()),
                  );
                },
                child: const Text(
                  'Bài tập hướng dẫn 2 (Todo App)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BTTL2Screen()),
                  );
                },
                child: const Text(
                  'BTTL 2 - Bài 4: Học từ vựng',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BTVNScreen()),
                  );
                },
                child: const Text(
                  'BTVN: Nhiệm vụ mỗi ngày',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
