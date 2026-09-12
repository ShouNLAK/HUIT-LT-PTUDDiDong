import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_2/Service.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_2/Service_Item.dart';

class BTTL_2 extends StatefulWidget {
  const BTTL_2({super.key});

  @override
  State<BTTL_2> createState() => _BTTL_2State();
}

class _BTTL_2State extends State<BTTL_2> {
  final List<Service> mainServices = [
    Service(title: 'Chuyển tiền', icon: Icons.monetization_on, iconColor: Colors.pink, imagePath: 'img/Momo/icon1.png'),
    Service(title: 'Thanh toán\nhóa đơn', icon: Icons.receipt_long, iconColor: Colors.teal, imagePath: 'img/Momo/icon2.png'),
    Service(title: 'Nạp tiền\nđiện thoại', icon: Icons.phone_android, iconColor: Colors.blue, imagePath: 'img/Momo/icon3.png'),
    Service(title: 'Mua mã thẻ\ndi động', icon: Icons.sim_card, iconColor: Colors.orange, imagePath: 'img/Momo/icon4.png'),
    Service(title: 'Heo Đất\nMoMo', icon: Icons.savings, iconColor: Colors.pinkAccent, imagePath: 'img/Momo/icon5.png'),
    Service(title: 'Đi bộ cùng\nMoMo', icon: Icons.directions_walk, iconColor: Colors.green, imagePath: 'img/Momo/icon6.png'),
    Service(title: 'Thanh toán\nnước', icon: Icons.water_drop, iconColor: Colors.blueAccent, imagePath: 'img/Momo/icon7.png'),
    Service(title: 'Quản lý\nchi tiêu', icon: Icons.account_balance_wallet, iconColor: Colors.teal, imagePath: 'img/Momo/icon8.png'),
    Service(title: 'Quỹ nhóm', icon: Icons.groups, iconColor: Colors.pink, imagePath: 'img/Momo/icon9.png'),
    Service(title: 'Chứng Khoán', icon: Icons.show_chart, iconColor: Colors.blue, imagePath: 'img/Momo/icon10.png'),
    Service(title: 'Vietlott SMS', icon: Icons.sms, iconColor: Colors.red, imagePath: 'img/Momo/icon11.png'),
    Service(title: 'Xem thêm\ndịch vụ', icon: Icons.grid_view, iconColor: Colors.grey, imagePath: 'img/Momo/icon12.png'),
  ];

  final List<Service> recommendServices = [
    Service(title: 'Vay Nhanh', icon: Icons.monetization_on_outlined, iconColor: Colors.orange, imagePath: 'img/Momo/2_icon1.png'),
    Service(title: 'Mua vé\nxem phim', icon: Icons.movie_outlined, iconColor: Colors.orangeAccent, imagePath: 'img/Momo/2_icon2.png'),
    Service(title: 'Túi Thần Tài', icon: Icons.redeem, iconColor: Colors.redAccent, imagePath: 'img/Momo/2_icon3.png'),
    Service(title: 'Ví Trả Sau', icon: Icons.account_balance, iconColor: Colors.pinkAccent, imagePath: 'img/Momo/2_icon4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MoMo UI Demo', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: mainServices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return Service_Item(item: mainServices[index]);
              },
            ),

            _buildSectionTitle('Sự kiện đang diễn ra'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'img/Momo/SuKienDangDienRa.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildSectionTitle('MoMo đề xuất'),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: recommendServices.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 90,
                    margin: const EdgeInsets.only(right: 8),
                    child: Service_Item(item: recommendServices[index]),
                  );
                },
              ),
            ),

            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(16),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.temple_buddhist, color: Colors.orange),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '2025 nhờ ai mà nở hoa?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Gieo quẻ với AI, tìm quý nhân...',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.pink),
                      ),
                    ),
                    child: const Text('Gieo ngay'),
                  ),
                ],
              ),
            ),

            _buildSectionTitle('Có thể bạn quan tâm'),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'MoMo',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Ưu đãi',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
            ),
            label: 'Quét mọi QR',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Lịch sử GD',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Tôi',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
