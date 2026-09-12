import 'package:b5_nguyen_le_anh_khoa/BTTL_1/DeTai.dart';
import 'package:flutter/material.dart';

class DeTai_Item extends StatelessWidget {
  final DeTai deTai;
  
  const DeTai_Item({super.key, required this.deTai});

  @override
  Widget build(BuildContext context) { 
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1), 
      ),
      alignment: Alignment.center,
      child: Text(
        deTai.getLoaiDeTai,
        style: const TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}