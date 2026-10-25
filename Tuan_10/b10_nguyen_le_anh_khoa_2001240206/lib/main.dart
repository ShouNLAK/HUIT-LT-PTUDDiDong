import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/views/task_screen.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTTL2/views/student_screen.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN1/views/chi_tieu_screen.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN2/views/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tuần 10 - SQLite Database',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuần 10 - SQLite Database'),
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
                'DANH SÁCH BÀI TẬP TUẦN 10',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskScreen()),
                  );
                },
                child: const Text(
                  'Bài tập hướng dẫn (Quản lý công việc)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentScreen()),
                  );
                },
                child: const Text(
                  'Bài tập trên lớp (BTTL 2 - Quản lý sinh viên)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChiTieuScreen()),
                  );
                },
                child: const Text(
                  'Bài tập về nhà 1 (BTVN 1 - Quản lý chi tiêu)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                  );
                },
                child: const Text(
                  'Bài tập về nhà 2 (BTVN 2 - Đăng nhập / Đăng ký)',
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
