import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_3/Voucher.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_3/Voucher_Item.dart';

class BTTL_3 extends StatefulWidget {
  const BTTL_3({
    super.key
  });

  @override
  State<BTTL_3> createState() => _BTTL_3State();
}

class _BTTL_3State extends State<BTTL_3> {
  final List<Voucher> vouchers = [
    Voucher(
      provider: 'CGV',
      title: 'CGV -',
      description: 'Đồng giá 79K khi mua vé CGV 2D trên M...',
      expiry: 'HSD: 28/02/2025',
      actionText: 'Dùng ngay',
      isFavorite: false,
      iconData: Icons.movie,
      iconColor: Colors.red,
    ),
    Voucher(
      provider: 'Mua Sim\nchính chủ',
      title: 'Giảm 100K',
      description: 'Cho đơn từ 0đ',
      expiry: 'HSD: 28/02/2025',
      actionText: 'Dùng ngay',
      isFavorite: true,
      iconData: Icons.sim_card,
      iconColor: Colors.pink,
    ),
    Voucher(
      provider: 'Ngân hàng\nQuốc Tế VIB',
      title: 'Tặng 100k',
      description: 'Khi mở thẻ VIB Online Plus 2in1 (*)',
      expiry: 'HSD: 31/03/2025',
      actionText: 'Dùng ngay',
      isFavorite: false,
      iconData: Icons.credit_card,
      iconColor: Colors.blue,
    ),
    Voucher(
      provider: 'Thanh toán\nBảo hiểm',
      title: 'Hoàn 15K',
      description: 'Cho hóa đơn từ 3.000.000đ',
      expiry: 'Hết hạn sau 5 ngày',
      actionText: 'Dùng ngay',
      isFavorite: false,
      iconData: Icons.umbrella,
      iconColor: Colors.blue,
    ),
    Voucher(
      provider: 'Phí không\ndừng',
      title: 'Giảm 10K',
      description: 'Cho đơn từ 100K',
      expiry: '',
      actionText: 'Thu thập',
      isFavorite: false,
      iconData: Icons.directions_car,
      iconColor: Colors.orange,
      isThuThap: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, 
            color: Colors.black
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quà của Vinh (7)', 
          style: TextStyle(
            color: Colors.black, 
            fontSize: 16
          )
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.headset_mic_outlined, 
              color: Colors.black
            ), 
            onPressed: () {}
          ),
          IconButton(
            icon: const Icon(
              Icons.cancel_outlined, 
              color: Colors.black
            ), 
            onPressed: () {}
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 8, 
              horizontal: 16
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(Icons.filter_alt_outlined, ''),
                  const SizedBox(
                    width: 8
                  ),
                  _buildFilterChip(null, 'Sắp xếp ='),
                  const SizedBox(
                    width: 8
                  ),
                  _buildFilterChip(null, 'Dịch vụ v'),
                  const SizedBox(
                    width: 8
                  ),
                  _buildFilterChip(null, 'Gần tôi'),
                  const SizedBox(
                    width: 8
                  ),
                  _buildFilterChip(null, 'Yêu thích'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.orange
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.monetization_on, 
                          color: Colors.orange
                        ),
                        const SizedBox(
                          width: 8
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Đang có', 
                              style: TextStyle(
                                fontSize: 12, 
                                color: Colors.grey
                              )
                            ),
                            Text(
                              '1.955 Xu', 
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right, 
                          color: Colors.orange
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.card_giftcard, 
                          color: Colors.redAccent
                        ),
                        const SizedBox(
                          width: 8
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Bỏ túi ngay', 
                              style: TextStyle(
                                fontSize: 12, 
                                color: Colors.white
                              )
                            ),
                            Text(
                              '4 thẻ quà', 
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.white
                              )
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right, 
                          color: Colors.white
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vouchers.length,
              itemBuilder: (context, index) {
                return Voucher_Item(
                  voucher: vouchers[index]
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(IconData? icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12, 
        vertical: 6
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey
        ),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(
            icon, 
            size: 16, 
            color: Colors.grey
          ),
          if (icon != null && text.isNotEmpty) const SizedBox(
            width: 4
          ),
          if (text.isNotEmpty) Text(
            text, 
            style: const TextStyle(
              fontSize: 13
            )
          ),
        ],
      ),
    );
  }
}
