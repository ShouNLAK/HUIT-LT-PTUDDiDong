import 'package:b5_nguyen_le_anh_khoa/BTTL_1/ChuyenNganh..dart';
import 'package:flutter/material.dart';

class ChuyenNganh_Item extends StatelessWidget{
 final ChuyenNganh chuyenNganh;
 const ChuyenNganh_Item({super.key, required this.chuyenNganh});

  static const TextStyle _textStyle = TextStyle( 
    fontSize: 20, 
    color: Colors.red, 
    fontWeight: FontWeight.bold, 
  ); 

  Widget _taoListItem(BuildContext context, String tenChuyenNganh, String moTa, String tenVietTat)
  {
    return ListTile( 
          leading: const Icon(Icons.home), 
          title: Text(tenChuyenNganh,
          style: _textStyle,),
          subtitle: Text(moTa), 
          trailing: const Icon(Icons.arrow_forward), 
          onTap: () { 
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Thông báo'),
                content: Text('Bạn chọn $tenVietTat'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Đóng'),
                  ),
                ],
              ),
            );
          }, 
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _taoListItem(
          context,
          chuyenNganh.getTenChuyenNganh, 
          chuyenNganh.getMoTa, 
          chuyenNganh.getTenVietTat)
      ],
    );
  }
}