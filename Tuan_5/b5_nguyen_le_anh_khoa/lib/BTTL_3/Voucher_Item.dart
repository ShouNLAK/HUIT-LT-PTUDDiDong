import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_3/Voucher.dart';

class Voucher_Item extends StatelessWidget {
  final Voucher voucher;

  const Voucher_Item({
    super.key, 
    required this.voucher
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12, 
        left: 16, 
        right: 16
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  voucher.getIconData, 
                  color: voucher.getIconColor, 
                  size: 24
                ),
                const SizedBox(
                  height: 4
                ),
                Text(
                  voucher.getProvider,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher.getTitle,
                  style: const TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 4
                ),
                Text(
                  voucher.getDescription,
                  style: const TextStyle(
                    fontSize: 13, 
                    color: Colors.grey
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4
                ),
                Text(
                  voucher.getExpiry,
                  style: TextStyle(
                    fontSize: 12, 
                    color: voucher.getExpiry.contains('Hết hạn') ? Colors.orange : Colors.grey
                  ),
                ),
                const SizedBox(
                  height: 8
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: voucher.getIsThuThap
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16, 
                            vertical: 6
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.pink
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            voucher.getActionText,
                            style: const TextStyle(
                              color: Colors.pink, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      : Text(
                          voucher.getActionText,
                          style: const TextStyle(
                            color: Colors.pink, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8
          ),
          Icon(
            voucher.getIsFavorite ? Icons.favorite : Icons.favorite_border,
            color: voucher.getIsFavorite ? Colors.pink : Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }
}
