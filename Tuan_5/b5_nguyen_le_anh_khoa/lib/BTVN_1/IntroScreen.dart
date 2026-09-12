import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTVN_1/ShopScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Icon(
                  Icons.school, 
                  size: 80, 
                  color: Colors.blue
                ),
              ),
            ),
            const SizedBox(
              height: 24
            ),
            const Text(
              'Cửa hàng điện thoại',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 16
            ),
            const Text(
              '140 Lê Trọng Tấn, Tân Phú, TP.Hồ Chí Minh',
              style: TextStyle(
                fontSize: 14, 
                color: Colors.grey
              ),
            ),
            const SizedBox(
              height: 32
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopScreen()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
