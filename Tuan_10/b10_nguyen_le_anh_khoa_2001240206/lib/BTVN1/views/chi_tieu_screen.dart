import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN1/controllers/ChiTieuController.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN1/models/ChiTieu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChiTieuScreen extends StatefulWidget {
  const ChiTieuScreen({super.key});

  @override
  State<ChiTieuScreen> createState() => _ChiTieuScreenState();
}

class _ChiTieuScreenState extends State<ChiTieuScreen> {
  final ChiTieuController _controller = ChiTieuController();
  List<ChiTieu> _expenses = [];
  int _totalAmount = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final NumberFormat _currencyFormat = NumberFormat('#,###', 'vi_VN');

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    List<ChiTieu> list;
    if (_searchQuery.isEmpty) {
      list = await _controller.fetch();
    } else {
      list = await _controller.search(_searchQuery);
    }
    final total = await _controller.getTotalAmount();
    setState(() {
      _expenses = list;
      _totalAmount = total;
    });
  }

  void _showChiTieuDialog({ChiTieu? chiTieu}) {
    final bool isEditing = chiTieu != null;
    final TextEditingController noiDungController =
        TextEditingController(text: isEditing ? chiTieu.noiDungChiTieu : '');
    final TextEditingController soTienController =
        TextEditingController(text: isEditing ? chiTieu.soTien.toString() : '');
    final TextEditingController ghiChuController =
        TextEditingController(text: isEditing ? chiTieu.ghiChu : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'Cập nhật chi tiêu' : 'Thêm chi tiêu mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: noiDungController,
                  decoration: const InputDecoration(
                    labelText: 'Nội dung chi tiêu',
                    hintText: 'Ăn uống, mua sắm...',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: soTienController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Số tiền (VNĐ)',
                    hintText: 'Nhập số tiền',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: ghiChuController,
                  decoration: const InputDecoration(
                    labelText: 'Ghi chú',
                    hintText: 'Ghi chú chi tiết...',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                final noiDung = noiDungController.text.trim();
                final soTienStr = soTienController.text.trim();
                final ghiChu = ghiChuController.text.trim();

                if (noiDung.isEmpty || soTienStr.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vui lòng nhập đầy đủ nội dung và số tiền!'),
                    ),
                  );
                  return;
                }

                final int? soTien = int.tryParse(soTienStr);
                if (soTien == null || soTien <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Số tiền phải là số nguyên dương hợp lệ!'),
                    ),
                  );
                  return;
                }

                if (isEditing) {
                  final updated = ChiTieu(
                    id: chiTieu.id,
                    noiDungChiTieu: noiDung,
                    soTien: soTien,
                    ghiChu: ghiChu,
                  );
                  await _controller.update(updated);
                } else {
                  final newItem = ChiTieu(
                    noiDungChiTieu: noiDung,
                    soTien: soTien,
                    ghiChu: ghiChu,
                  );
                  await _controller.insert(newItem);
                }

                if (context.mounted) {
                  Navigator.pop(context);
                }
                _loadExpenses();
              },
              child: Text(isEditing ? 'Cập nhật' : 'Lưu'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(ChiTieu item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: Text(
            'Bạn có chắc chắn muốn xóa mục "${item.noiDungChiTieu}" không?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (item.id != null) {
                  await _controller.delete(item.id!);
                }
                if (context.mounted) {
                  Navigator.pop(context);
                }
                _loadExpenses();
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý chi tiêu cá nhân'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tổng chi tiêu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${_currencyFormat.format(_totalAmount)} đ',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Số mục chi tiêu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${_expenses.length}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
                _loadExpenses();
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm theo nội dung, ghi chú...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                          _loadExpenses();
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _expenses.isEmpty
                  ? const Center(
                      child: Text(
                        'Chưa có mục chi tiêu nào',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _expenses.length,
                      itemBuilder: (context, index) {
                        final item = _expenses[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.account_balance_wallet),
                            ),
                            title: Text(
                              item.noiDungChiTieu,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: item.ghiChu.isNotEmpty
                                ? Text(item.ghiChu)
                                : null,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '- ${_currencyFormat.format(item.soTien)} đ',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () => _confirmDelete(item),
                                ),
                              ],
                            ),
                            onTap: () => _showChiTieuDialog(chiTieu: item),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showChiTieuDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
