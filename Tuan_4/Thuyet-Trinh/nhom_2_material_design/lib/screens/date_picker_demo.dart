import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày được chọn ban đầu
      firstDate: DateTime(2020),   // Ngày nhỏ nhất được phép chọn
      lastDate: DateTime(2030),    // Ngày lớn nhất được phép chọn
    );
    
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Khái niệm:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Thành phần giao diện cho phép người dùng chọn một ngày (Ngày/tháng/năm) trong ứng dụng thông qua hàm showDatePicker().', style: TextStyle(fontSize: 15)),
            
            const SizedBox(height: 20),
            const Text('Các thuộc tính cốt lõi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('• context: Xác định vị trí của giao diện hiện tại.\n• initialDate: Ngày được chọn ban đầu.\n• firstDate: Ngày nhỏ nhất được phép chọn.\n• lastDate: Ngày lớn nhất được phép chọn.', style: TextStyle(fontSize: 15, height: 1.5)),
            
            const SizedBox(height: 30),
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                ),
                child: Text(
                  _selectedDate == null
                      ? 'Chưa chọn ngày nào'
                      : 'Kết quả DateTime: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: const TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calendar_month),
                onPressed: _presentDatePicker,
                label: const Text('Mở showDatePicker()'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
