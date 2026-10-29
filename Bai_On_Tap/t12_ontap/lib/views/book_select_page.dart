import 'package:flutter/material.dart';
import '../controllers/LoaiSachController.dart';
import '../controllers/SachController.dart';
import '../models/LoaiSach.dart';
import '../models/Sach.dart';
import 'cart_page.dart';

class BookSelectPage extends StatefulWidget {
  final String? username;
  const BookSelectPage({super.key, this.username});

  @override
  State<BookSelectPage> createState() => _BookSelectPageState();
}

class _BookSelectPageState extends State<BookSelectPage> {
  final SachController _sachController = SachController();
  final LoaiSachController _loaiSachController = LoaiSachController();

  List<LoaiSach> _loaiSachList = [];
  List<Sach> _sachList = [];
  final List<Map<String, dynamic>> _gioHang = [];

  int _selectedMaLoai = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final loaiList = await _loaiSachController.fetchTK(LoaiSach(maLoai: 0, tenLoai: ''));
    final sachList = await _sachController.fetchTK(Sach(maSach: 0, tenSach: ''));

    setState(() {
      _loaiSachList = loaiList;
      _sachList = sachList;
      _isLoading = false;
    });
  }

  List<Sach> get _filteredSach {
    if (_selectedMaLoai == 0) return _sachList;
    if (_selectedMaLoai == 1) {
      return _sachList.where((s) => s.maSach <= 3).toList();
    } else {
      return _sachList.where((s) => s.maSach > 3).toList();
    }
  }

  double _getGiaBan(int maSach) {
    switch (maSach) {
      case 1: return 45000;
      case 2: return 55000;
      case 3: return 25000;
      case 4: return 35000;
      default: return 50000;
    }
  }

  void _chonSach(Sach sach) {
    setState(() {
      final index = _gioHang.indexWhere((item) => item['maSach'] == sach.maSach);
      if (index >= 0) {
        _gioHang[index]['soLuong'] += 1;
      } else {
        _gioHang.add({
          'maSach': sach.maSach,
          'tenSach': sach.tenSach,
          'giaBan': _getGiaBan(sach.maSach),
          'soLuong': 1,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int tongSoLuong = _gioHang.fold(0, (sum, item) => sum + (item['soLuong'] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh mục sách'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('$tongSoLuong'),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    username: widget.username,
                    gioHang: _gioHang,
                  ),
                ),
              );
              setState(() {});
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.filter_alt, color: Colors.orange),
                const SizedBox(width: 8),
                const Text('Hãy lựa chọn loại sách bạn muốn: '),
                const Spacer(),
                DropdownButton<int>(
                  value: _selectedMaLoai,
                  items: [
                    const DropdownMenuItem<int>(
                      value: 0,
                      child: Text('Tất cả'),
                    ),
                    ..._loaiSachList.map((loai) => DropdownMenuItem<int>(
                          value: loai.maLoai,
                          child: Text(loai.tenLoai),
                        )),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _selectedMaLoai = val);
                    }
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _filteredSach.length,
                    itemBuilder: (context, index) {
                      final sach = _filteredSach[index];
                      final gia = _getGiaBan(sach.maSach);
                      return ListTile(
                        leading: const Icon(Icons.book, color: Colors.blue),
                        title: Text(sach.tenSach),
                        subtitle: Text('$gia đ', style: const TextStyle(color: Colors.red)),
                        trailing: ElevatedButton(
                          onPressed: () => _chonSach(sach),
                          child: const Text('Chọn'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}