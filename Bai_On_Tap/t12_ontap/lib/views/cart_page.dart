import 'package:flutter/material.dart';
import '../controllers/ChonSachController.dart';
import '../controllers/HoaDonController.dart';
import '../models/ChonSach.dart';
import '../models/HoaDon.dart';
import 'login_page.dart';

class CartPage extends StatefulWidget {
  final String? username;
  final List<Map<String, dynamic>> gioHang;

  const CartPage({super.key, this.username, required this.gioHang});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final HoaDonController _hoaDonController = HoaDonController();
  final ChonSachController _chonSachController = ChonSachController();

  double get _tongTien {
    return widget.gioHang.fold(
      0.0,
      (sum, item) => sum + ((item['giaBan'] as num) * (item['soLuong'] as int)),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text("Bạn muốn xóa sách '${widget.gioHang[index]['tenSach']}' khỏi giỏ hàng?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              setState(() => widget.gioHang.removeAt(index));
              Navigator.pop(ctx);
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  Future<void> _thanhToan() async {
    if (widget.gioHang.isEmpty) return;

    final int maHD = DateTime.now().millisecondsSinceEpoch;

    final hoaDon = HoaDon(
      maHD: maHD,
      tenDangNhap: widget.username ?? '',
      ngayMua: DateTime.now(),
      tongTien: _tongTien,
    );
    await _hoaDonController.insertTK(hoaDon);

    for (int i = 0; i < widget.gioHang.length; i++) {
      final item = widget.gioHang[i];
      final chonSach = ChonSach(
        id: DateTime.now().microsecondsSinceEpoch + i,
        maSach: item['maSach'].toString(),
        soLuong: item['soLuong'] as int,
        giaBan: (item['giaBan'] as num).toDouble(),
        maHD: maHD,
      );
      await _chonSachController.insertTK(chonSach);
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thanh toán thành công!')),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = widget.username != null && widget.username!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng Của Bạn'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.gioHang.length,
              itemBuilder: (context, index) {
                final item = widget.gioHang[index];
                return ListTile(
                  leading: const Icon(Icons.book, color: Colors.blue),
                  title: Text(item['tenSach'].toString()),
                  subtitle: Text('${item['giaBan']} đ', style: const TextStyle(color: Colors.red)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          if (item['soLuong'] > 1) {
                            setState(() => item['soLuong'] -= 1);
                          } else {
                            _confirmDelete(index);
                          }
                        },
                      ),
                      Text('${item['soLuong']}'),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() => item['soLuong'] += 1);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isLoggedIn
                  ? 'Bạn đã đăng nhập với tên là: ${widget.username}'
                  : 'Bạn chưa đăng nhập',
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tổng tiền thanh toán:'),
                Text('$_tongTien đ', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoggedIn ? _thanhToan : null,
                child: const Text('THANH TOÁN'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}