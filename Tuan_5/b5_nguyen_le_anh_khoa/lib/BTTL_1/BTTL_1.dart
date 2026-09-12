import 'package:b5_nguyen_le_anh_khoa/BTTL_1/ChuyenNganh..dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_1/ChuyenNganh_Item.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_1/DeTai.dart';
import 'package:b5_nguyen_le_anh_khoa/BTTL_1/DeTai_Item.dart';
import 'package:flutter/material.dart';

class BTTL_1 extends StatefulWidget {
  const BTTL_1({super.key});

  @override
  State<StatefulWidget> createState() => _MyDialogState();
}

class _MyDialogState extends State<BTTL_1> {
  static List<ChuyenNganh> dsChuyenNganh = [
    ChuyenNganh(tenChuyenNganh: "Công nghệ phần mềm", moTa: "Phát triển các ứng dụng giải quyết các vấn đề thực tế", tenVietTat: "CNPM"),
    ChuyenNganh(tenChuyenNganh: "Hệ thống thông tin", moTa: "Phát triển các kỹ thuật xử lý thông tin trong tổ chức", tenVietTat: "HTTT"),
    ChuyenNganh(tenChuyenNganh: "Mạng máy tính", moTa: "Xử lý các vân đề liên quan đến mạng máy tính", tenVietTat: "MTT"),
    ChuyenNganh(tenChuyenNganh: "An toàn thông tin", moTa: "Thiết kế và đảm bảo an toàn cho hệ thống máy tính", tenVietTat: "BMTT")
  ];

  static List<DeTai> dsDeTai = [
    DeTai(loaiDeTai: "Đồ án"),
    DeTai(loaiDeTai: "KLKS"),
    DeTai(loaiDeTai: "Luận văn"),
    DeTai(loaiDeTai: "Khác"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Demo"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              "Chọn loại đề tài",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18, 
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dsDeTai.map((detai) => DeTai_Item(deTai: detai)).toList(),
            ),
          ),
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              "Chọn chuyên ngành thực hiện",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18, 
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dsChuyenNganh.length,
              itemBuilder: (context, index) {
                return ChuyenNganh_Item(chuyenNganh: dsChuyenNganh[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}