import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Widget'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. Cơ chế Thu hẹp (Shrink-wrap):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Không cấu hình width/height, không có alignment -> Container co lại vừa khít với kích thước của phần tử child.'),
            const SizedBox(height: 8),
            Container(
              color: Colors.blueAccent,
              child: const Text(' Nội dung vừa khít ', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),

            const SizedBox(height: 20),
            const Text('2. Cơ chế Mở rộng (Expand):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Không cố định kích thước nhưng được thiết lập alignment -> Tự động giãn ra tối đa để lấp đầy không gian khả dụng.'),
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: const Text('Căn giữa & Giãn ra tối đa ngang', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),

            const SizedBox(height: 20),
            const Text('3. Cơ chế Tuân thủ ràng buộc (Constraints):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Sử dụng width, height, padding, margin, decoration (color, borderRadius, border, boxShadow). Container giới hạn kích thước phần tử con.'),
            const SizedBox(height: 8),
            Container(
              width: 280,
              height: 120,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red, width: 3),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withValues(alpha: 0.5), blurRadius: 10, offset: const Offset(5, 5))
                ]
              ),
              child: const Text('Ràng buộc 280x120', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),

            const SizedBox(height: 20),
            const Text('4. Thuộc tính clipBehavior:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Cắt bỏ phần nội dung tràn viền (Clip.hardEdge).'),
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Transform.scale(
                  scale: 1.5,
                  child: const Icon(Icons.star, size: 100, color: Colors.yellow),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            const Text('Lỗi phổ biến & Giải pháp (Troubleshooting):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
            const Text('- Unbounded height/width: Do đặt Container co giãn trong ListView/ScrollView. Khắc phục: Bọc trong SizedBox cố định hoặc Expanded/Flexible.', style: TextStyle(fontSize: 14)),
            const Text('- Code rườm rà (Anti-pattern): Dùng Container chỉ để tạo khoảng trống. Khắc phục: Thay bằng SizedBox.', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
