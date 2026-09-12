import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/Phone.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/CartManager.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/CartScreen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({
    super.key
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<Phone> phones = [
    Phone(
      id: '1',
      name: 'Điện thoại 01',
      description: 'điện thoại mới của hãng SamSung với công nghệ hiện đại',
      price: 1200.0,
      imagePath: '',
    ),
    Phone(
      id: '2',
      name: 'Điện thoại 02',
      description: 'điện thoại mới với công nghệ hiện đại',
      price: 200.0,
      imagePath: '',
    ),
    Phone(
      id: '3',
      name: 'Điện thoại 03',
      description: 'điện thoại công nghệ cao',
      price: 800.0,
      imagePath: '',
    ),
  ];

  void _showAddToCartDialog(Phone phone) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          title: const Text('Xác nhận'),
          content: const Text('Bạn vừa thêm sản phẩm vào Giỏ hàng'),
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
                CartManager.addToCart(phone);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Cửa hàng điện thoại', 
          style: TextStyle(
            color: Colors.black
          )
        ),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen()
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.school, 
                    size: 60, 
                    color: Colors.blue
                  ),
                  const SizedBox(
                    height: 8
                  ),
                  const Text(
                    'Vũ Văn Vinh', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  const Text(
                    'vinhvv@huit.edu.vn', 
                    style: TextStyle(
                      color: Colors.grey
                    )
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.store, 
                color: Colors.black
              ),
              title: const Text('Cửa hàng'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart, 
                color: Colors.black
              ),
              title: const Text('Giỏ hàng'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen()
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app, 
                color: Colors.black
              ),
              title: const Text('Thoát'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Chọn sản phẩm bạn muốn sử dụng',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: phones.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8
                ),
                itemBuilder: (context, index) {
                  return _buildPhoneCard(phones[index]);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Sản phẩm được lựa chọn nhiều nhất',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: phones.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8
                ),
                itemBuilder: (context, index) {
                  return _buildPhoneCard(phones[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneCard(Phone phone) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(
        horizontal: 8
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16)
                ),
              ),
              child: const Icon(
                Icons.smartphone, 
                size: 100, 
                color: Colors.white
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phone.getName, 
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 16
                  )
                ),
                const SizedBox(
                  height: 8
                ),
                Text(
                  phone.getDescription, 
                  style: const TextStyle(
                    fontSize: 12, 
                    color: Colors.grey
                  ), 
                  maxLines: 3
                ),
                const SizedBox(
                  height: 16
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${phone.getPrice}', 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    InkWell(
                      onTap: () => _showAddToCartDialog(phone),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add, 
                          color: Colors.black, 
                          size: 20
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
