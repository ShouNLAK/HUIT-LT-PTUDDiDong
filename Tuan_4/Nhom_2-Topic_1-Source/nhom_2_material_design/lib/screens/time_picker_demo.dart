import 'package:flutter/material.dart';

class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  TimeOfDay? _selectedTime;

  void _presentTimePicker() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Khái niệm:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('Thành phần giao diện cho phép người dùng chọn thời gian (Giờ/phút) thường dùng cho đặt lịch thông qua hàm showTimePicker().', style: TextStyle(fontSize: 15)),
            
            const SizedBox(height: 20),
            const Text('Các thuộc tính cốt lõi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('• context: Xác định vị trí của giao diện hiện tại.\n• initialTime: Thời gian được chọn ban đầu.', style: TextStyle(fontSize: 15, height: 1.5)),
            
            const SizedBox(height: 30),
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  _selectedTime == null
                      ? 'Chưa chọn giờ nào'
                      : 'Kết quả TimeOfDay: ${_selectedTime!.format(context)}',
                  style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.access_time),
                onPressed: _presentTimePicker,
                label: const Text('Mở showTimePicker()'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), backgroundColor: Colors.green, foregroundColor: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            const Divider(),
            const Text('So sánh nhanh (Theo tài liệu):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Text('- Mục đích: Date (Chọn ngày) vs Time (Chọn giờ)\n- Kiểu dữ liệu trả về: DateTime? vs TimeOfDay?\n- Giá trị ban đầu: initialDate vs initialTime', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
