import 'package:flutter/material.dart';
import '../controllers/TaiKhoanController.dart';
import '../models/TaiKhoan.dart';
import 'book_select_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TaiKhoanController _taiKhoanController = TaiKhoanController();
  bool _obscurePassword = true;

  Future<void> _login() async {
    final List<TaiKhoan> dsTaiKhoan = await _taiKhoanController.fetchTK(
      TaiKhoan(tenDangNhap: '', matKhau: '', doTuoi: 0, gioiTinh: false),
    );

    final bool isHopLe = dsTaiKhoan.any(
      (tk) =>
          tk.tenDangNhap == _usernameController.text.trim() &&
          tk.matKhau == _passwordController.text,
    );

    if (!mounted) return;

    if (isHopLe) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookSelectPage(
            username: _usernameController.text.trim(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sai tên đăng nhập hoặc mật khẩu!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2001240206 - Nguyễn Lê Anh Khoa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bookmark, size: 70, color: Colors.blue),
            const Text(
              'MỞ RỘNG TÂM HỒN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Tên đăng nhập',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('ĐĂNG NHẬP'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã bỏ qua đăng nhập')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookSelectPage(username: null),
                    ),
                  );
                },
                child: const Text('BỎ QUA ĐĂNG NHẬP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}