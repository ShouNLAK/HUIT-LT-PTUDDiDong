import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  const DialogDemo({super.key});

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn có chắc muốn xóa không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Xóa', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Chọn phương thức thanh toán'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Tiền mặt'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('○ Tiền mặt', style: TextStyle(fontSize: 16)),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Thẻ ngân hàng'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('○ Thẻ ngân hàng', style: TextStyle(fontSize: 16)),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Ví điện tử'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('○ Ví điện tử', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Vừa khít nội dung
              children: [
                const Icon(Icons.settings, color: Colors.blue, size: 50),
                const SizedBox(height: 15),
                const Text('Custom Dialog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Widget Dialog cơ bản cho phép lập trình viên tự thiết kế toàn bộ nội dung tùy chỉnh bên trong.', textAlign: TextAlign.center),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Đóng'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Các loại Dialogs')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Khái niệm:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Dialog hiển thị hộp thoại nổi lên trên giao diện để thông báo, yêu cầu xác nhận hoặc lựa chọn thao tác (Xác nhận, Hủy, Chọn, Đóng). Hàm showDialog() nhận tham số context và builder.'),
            const SizedBox(height: 30),
            
            const Text('1. AlertDialog:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Thông báo hoặc yêu cầu xác nhận. Gồm 3 phần: title, content, actions.'),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => _showAlertDialog(context),
                child: const Text('Mở AlertDialog (Ví dụ Xóa)'),
              ),
            ),

            const SizedBox(height: 30),
            const Text('2. SimpleDialog:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Cung cấp cho người dùng nhiều lựa chọn thao tác nhanh.'),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => _showSimpleDialog(context),
                child: const Text('Mở SimpleDialog (Ví dụ Thanh toán)'),
              ),
            ),

            const SizedBox(height: 30),
            const Text('3. Dialog (Custom):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Widget cơ bản nhất cho phép tự thiết kế giao diện tùy chỉnh hoàn toàn.'),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => _showCustomDialog(context),
                child: const Text('Mở Dialog cơ bản'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
