import 'package:flutter/material.dart';

class BTHD_1 extends StatefulWidget{
  const BTHD_1({super.key});

@override
  State<StatefulWidget> createState() => _MyDialogState();
}
class _MyDialogState extends State<BTHD_1>{

  void _showDialog(String title, String content){
    showDialog(context: context,
     builder: (BuildContext context)  {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      }
    );
  }

  Widget _taoListItem(String tenChuyenNganh, String moTa, String tenVietTat)
  {
    return ListTile( 
          leading: const Icon(Icons.home), 
          title: Text(tenChuyenNganh,
          style: _textStyle,),
          subtitle: Text(moTa), 
          trailing: const Icon(Icons.arrow_forward), 
          onTap: () { 
            _showDialog("Thông báo", "Bạn chọn $tenVietTat"); 
          }, 
        );
  }

  static const TextStyle _textStyle = TextStyle( 
    fontSize: 20, 
    color: Colors.red, 
    fontWeight: FontWeight.bold, 
    ); 

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
      body: ListView(
        children: <Widget>[
          _taoListItem("Công nghệ phần mềm","Phát triển các ứng dụng giải quyết các vấn đề thực tế", "CNPM"),
          _taoListItem("Hệ thống thông tin","Phát triển các kỹ thuật xử lý thông tin trong tổ chức", "HTTT"),
          _taoListItem("Mạng máy tính","Xử lý các vân đề liên quan đến mạng máy tính", "MTT"),
          _taoListItem("An toàn thông tin","Thiết kế và đảm bảo an toàn cho hệ thống máy tính", "BMTT")
        ],
      ),
    );
  }
}