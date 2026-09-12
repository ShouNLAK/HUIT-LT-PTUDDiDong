import 'package:flutter/material.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_2/Service.dart';

class Service_Item extends StatelessWidget {
  final Service item;

  const Service_Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: item.getImagePath != null 
              ? Image.asset(
                  item.getImagePath!,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                )
              : Icon(
                  item.getIcon,
                  color: item.getIconColor,
                  size: 28,
                ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          item.getTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
