import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nguyen_le_anh_khoa_2001240206/controllers/TaiKhoanController.dart';
import 'package:nguyen_le_anh_khoa_2001240206/models/TaiKhoan.dart';
import 'package:nguyen_le_anh_khoa_2001240206/screens/ProductSelectPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TaiKhoanController _taiKhoanController = TaiKhoanController();

    Future<void> _login() async {
    final List<TaiKhoan> dsTaiKhoan = await _taiKhoanController.fetchTK();



    final bool isHopLe = dsTaiKhoan.any(
      (tk) =>
          tk.user == _usernameController.text.trim() &&
          tk.pass == _passwordController.text,
    );

    if (!mounted) return;

    if (isHopLe) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductSelectPage(
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
        title: Text(
          'Nông sản xanh', 
        style: TextStyle(color: Colors.white), 
        textAlign: TextAlign.center
        ),
        backgroundColor: Colors.blue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đăng nhập tài khoản', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                  _login();
              },
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductSelectPage(
                      username: _usernameController.text.trim(),
                    ),
                  ),
                );
              },
              child: Text('Bỏ qua đăng nhập', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}