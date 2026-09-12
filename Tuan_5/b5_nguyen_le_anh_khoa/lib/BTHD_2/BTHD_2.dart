import 'package:b5_nguyen_le_anh_khoa/BTHD_2/DeTai.dart';
import 'package:b5_nguyen_le_anh_khoa/BTHD_2/DeTai_Item.dart';
import 'package:flutter/material.dart';

class BTHD_2 extends StatefulWidget{
  const BTHD_2({super.key});

  @override
  State<StatefulWidget> createState() => _MyDialogState();
}

class _MyDialogState extends State<BTHD_2> { 
  void _showDialog(String title, String content) { 
      showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      }
    );
  }

  static List<DeTai> dsDeTai =[
    DeTai( 
      maDeTai: "DT01",
       tenDeTai: 'Khai thác tập hữu ích cao trên CSDL giao dịch', 
        tenGiangVien: 'ThS. Vũ Văn Vinh', 
        noiDung: 'Khai phá tập HUI, tìm hiểu và vận dụng các kỹ thuật tỉa hiệu quả để giảm bớt không gian tìm kiếm', 
        chuyenNganh: 'CNPM'
        ), 
    DeTai( 
        maDeTai: "DT03", 
        tenDeTai: 'Phát hiện tấn công và ngăn ngữa phát tán mã độc trong hệ thống mạng', 
        tenGiangVien: 'ThS. Vũ Văn Vinh', 
        noiDung: 'Khai phá topKHUI, kết hợp với việc tăng ngưỡng sớm để có được minUtil lớn nhất, từ đó áp dùng các chiến lược tỉa và tăng ngưỡng.', 
        chuyenNganh: 'CNPM'
        ), 
    DeTai( 
        maDeTai: "DT02", 
        tenDeTai: 'Khai tác K tập hữu ích cao nhất (topKHUI)', 
        tenGiangVien: 'TS. Vũ Đức Thịnh', 
        noiDung: 'Khai phá topKHUI, kết hợp với việc tăng ngưỡng sớm để có được minUtil lớn nhất, từ đó áp dùng các chiến lược tỉa và tăng ngưỡng.', 
        chuyenNganh: 'MMT'), 
    DeTai( 
        maDeTai: "DT04", 
        tenDeTai: 'Xây dựng hệ thống thông tin hỗ trợ việc giảng dạy tại HUIT', 
        tenGiangVien: 'ThS. Nguyễn Văn Lễ', 
        noiDung: 'Khai phá topKHUI, kết hợp với việc tăng ngưỡng sớm để có được minUtil lớn nhất, từ đó áp dùng các chiến lược tỉa và tăng ngưỡng.', 
        chuyenNganh: 'HTTT')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Demo"),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
        icon: const Icon(Icons.home)
        ),
      ),
      body: ListView.builder(
        itemCount: dsDeTai.length,
        itemBuilder: (context, index) {
          return DeTai_Item(deTai: dsDeTai[index]);
        },
      )
    );
  }
}