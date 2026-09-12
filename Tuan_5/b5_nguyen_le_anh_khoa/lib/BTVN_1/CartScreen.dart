import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/Phone.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/CartManager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _showRemoveDialog(Phone phone) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          title: const Text('Xác nhận'),
          content: const Text('Bạn muốn loại bỏ sản phẩm này ra khỏi giỏ hàng'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Không', 
                style: TextStyle(
                  color: Colors.black
                )
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  CartManager.removeFromCart(phone);
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Đồng ý', 
                style: TextStyle(
                  color: Colors.black
                )
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          title: const Text('Thanh toán'),
          content: const Text('Bạn đã thanh toán xong giỏ hàng'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  CartManager.clearCart();
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Đóng', 
                style: TextStyle(
                  color: Colors.black
                )
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Giỏ hàng của bạn', 
          style: TextStyle(
            color: Colors.black
          )
        ),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: CartManager.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Bạn chưa bỏ sản phẩm nào vô giỏ hàng!!!',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Giỏ hàng của bạn'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: CartManager.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = CartManager.cartItems[index];
                      return ListTile(
                        title: Text(item.getName),
                        subtitle: Text('${item.getPrice}'),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete, 
                            color: Colors.black
                          ),
                          onPressed: () => _showRemoveDialog(item),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _showCheckoutDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32, 
                        vertical: 12
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Thanh toán', 
                      style: TextStyle(
                        fontSize: 16
                      )
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
