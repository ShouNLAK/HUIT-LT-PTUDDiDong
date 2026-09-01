import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ý nghĩa Stack'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Stack được dùng để xếp các Widget đè lên nhau (theo trục Z - chiều sâu). Widget khai báo sau sẽ đè lên Widget trước đó.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            const Text('1. Chấm thông báo (Notification Badge):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart, size: 60, color: Colors.blue),
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
            const Text('2. Chữ đè lên nền (Text Overlay):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.image, size: 80, color: Colors.white54), // Giả lập hình nền
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6), // Nền mờ cho chữ dễ đọc
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Dùng Stack để chữ luôn nổi trên hình',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
            const Text('3. Xếp chồng Avatar nhóm:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: 150,
              child: Stack(
                children: const [
                  Positioned(
                    left: 0,
                    child: CircleAvatar(radius: 30, backgroundColor: Colors.redAccent, child: Text('A', style: TextStyle(color: Colors.white))),
                  ),
                  Positioned(
                    left: 40,
                    child: CircleAvatar(radius: 30, backgroundColor: Colors.green, child: Text('B', style: TextStyle(color: Colors.white))),
                  ),
                  Positioned(
                    left: 80,
                    child: CircleAvatar(radius: 30, backgroundColor: Colors.blueAccent, child: Text('C', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
