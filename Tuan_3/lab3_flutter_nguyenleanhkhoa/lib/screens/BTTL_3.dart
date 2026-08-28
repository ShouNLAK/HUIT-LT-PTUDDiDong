import 'package:flutter/material.dart';

class BTTL3 extends StatelessWidget {
  const BTTL3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thông tin sản phẩm",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chi tiết sản phẩm",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/chat-dong-ran-nhanh-kho-deltron-d8238/g1.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/chat-dong-ran-nhanh-kho-deltron-d8238/g2.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/chat-dong-ran-nhanh-kho-deltron-d8238/g3.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Tên sản phẩm: Chất đóng rắn nhanh khô Deltron D8238",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Mã sản phẩm: D8238",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Nhà sản xuất: Deltron",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Giá bán: Liên hệ",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Mô tả sản phẩm:",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Chất đóng rắn nhanh khô cho sơn lót ướt trên ướt (W.O.W) Deltron DP4000:\n- D8501 (sơn lót G1 màu xám trắng)\n- D8505 (sơn lót G5 màu xám)\n- D8507 (sơn lót G7 màu xám đen)",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  height: 1.4,
                ),
                textAlign: TextAlign.justify,
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Đặt hàng ngay",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}