import 'package:flutter/material.dart';
import 'package:nguyen_le_anh_khoa_2001240206/models/NongSan.dart';

class CartPage extends StatefulWidget {
  final List<NongSan> cart;
  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double tongTien = widget.cart.fold(0, (sum, item) => sum + item.giaBan);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final item = widget.cart[index];
                return ListTile(
                  title: Text(item.tenNS),
                  subtitle: Text('Giá: ${item.giaBan} đ'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        widget.cart.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            color: Colors.grey[200],
            child: Text(
              'Tổng tiền: $tongTien đ',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}