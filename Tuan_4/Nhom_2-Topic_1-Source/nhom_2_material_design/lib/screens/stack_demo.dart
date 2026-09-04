import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Xếp chồng các phần tử trong không gian 2D theo thứ tự vẽ (painting order). Phần tử khai báo trước nằm dưới, phần tử khai báo sau nằm trên.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),

            const Text('1. Badge Notification:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Sử dụng Positioned ghim tọa độ tuyệt đối (top, right).', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_cart, size: 60, color: Colors.blue),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text('2. Card Image Overlay:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Dùng Positioned.fill để phủ kín toàn bộ diện tích Stack (tạo nền và lớp mảng tối), dùng Align định vị Text.', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 300,
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.landscape, size: 100, color: Colors.white54),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Phong cảnh mùa thu',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text('3. User Avatar Status:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Ghim biểu tượng chấm màu Online/Offline góc dưới.', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text('Lỗi phổ biến & Giải pháp (Troubleshooting):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
            const Text('- Sọc vàng đen (Overflow): Phần tử Positioned đặt tọa độ vượt quá kích thước thật của Stack.', style: TextStyle(fontSize: 14)),
            const Text('- Khắc phục: Điều chỉnh tọa độ hoặc dùng clipBehavior: Clip.hardEdge để cắt phần thừa.', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned(
                      bottom: -20,
                      right: -20,
                      child: Container(width: 50, height: 50, color: Colors.red),
                    ),
                    const Align(alignment: Alignment.center, child: Text('Bị cắt góc'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
