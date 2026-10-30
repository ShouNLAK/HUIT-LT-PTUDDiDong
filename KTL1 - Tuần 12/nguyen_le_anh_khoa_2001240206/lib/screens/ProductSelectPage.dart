import 'package:flutter/material.dart';
import 'package:nguyen_le_anh_khoa_2001240206/controllers/LoaiNongSanController.dart';
import 'package:nguyen_le_anh_khoa_2001240206/controllers/NongSanController.dart';
import 'package:nguyen_le_anh_khoa_2001240206/models/LoaiNongSan.dart';
import 'package:nguyen_le_anh_khoa_2001240206/models/NongSan.dart';
import 'package:nguyen_le_anh_khoa_2001240206/screens/CartPage.dart';

class ProductSelectPage extends StatefulWidget {
  String? username;
  ProductSelectPage({super.key, this.username});

  @override
  _ProductSelectPage createState() => _ProductSelectPage();
}

class _ProductSelectPage extends State<ProductSelectPage> {
  List<NongSan> ds_nongsan = [];
  List<LoaiNongSan> ds_loainongsan = [];

  List<NongSan> cart = [];

  Future<void> addToCart(NongSan nongsan) async {
    setState(() {
      cart.add(nongsan);
    });
  }

  @override
  void initState() {
    super.initState();
    loadDS();
  }

  void loadDS() {
    NongSanController().fetchNS().then((ds) {
      setState(() {
        ds_nongsan = ds;
      });
    });

    LoaiNongSanController().fetchLNS().then((ds) {
      setState(() {
        ds_loainongsan = ds;
      });
    });
  }

  List<NongSan> getNongSanByLoai(String maLoai) {
    return ds_nongsan.where((ns) => ns.maLoai == maLoai).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nông sản xanh'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: const Text('Chọn loại nông sản'),
              value: null,
              items: ds_loainongsan.map((loai) {
                return DropdownMenuItem<String>(
                  value: loai.maLoai,
                  child: Text(loai.tenLoai),
                );
              }).toList(),
              onChanged: (maLoai) {
                setState(() {
                  ds_nongsan = getNongSanByLoai(maLoai!);
                });
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: ds_nongsan.length,
                itemBuilder: (context, index) {
                  final nongsan = ds_nongsan[index];
                  return ListTile(
                    leading: const Icon(Icons.book, color: Colors.blue),
                    title: Text(nongsan.tenNS),
                    subtitle: Text(
                      '${nongsan.giaBan} đ' + ' / ${nongsan.donViTinh}',
                      style: const TextStyle(color: Colors.orange),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () => addToCart(nongsan),
                      child: const Text('Thêm'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
