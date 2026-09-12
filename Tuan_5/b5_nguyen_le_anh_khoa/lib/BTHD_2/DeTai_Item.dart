import 'package:b5_nguyen_le_anh_khoa/BTHD_2/DeTai.dart';
import 'package:flutter/material.dart';

class DeTai_Item extends StatelessWidget {
  final DeTai deTai;
  const DeTai_Item({super.key, required this.deTai});

  static const TextStyle _textStyle = TextStyle(
    fontSize: 20,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      height: 230,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color:  Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(deTai.getMaDeTai, style: _textStyle),
            subtitle: Text(
              deTai.getNoiDung,
              style: TextStyle(fontSize: 18, color: Colors.blue),
              maxLines: 2,
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Thông báo'),
                    content: Text('Bạn chọn ${deTai.getTenDeTai}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Chuyên ngành: ${deTai.getNoiDung}',
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text('Giáo viên: ${deTai.getTenGiangVien}', textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
