import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD/NotificationService.dart';
import 'VocabModel.dart';
import 'VocabFileService.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final VocabFileService _fileService = VocabFileService();
  final NotificationService _notificationService = NotificationService();
  List<VocabReminder> _reminders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _notificationService.init();
    _loadReminders();
  }

  Future<void> _loadReminders() async {
    final list = await _fileService.loadReminders();
    setState(() {
      _reminders = list;
      _isLoading = false;
    });
  }

  Future<void> _deleteReminder(VocabReminder reminder) async {
    await _notificationService.cancelNotification(reminder.id);
    await _fileService.deleteReminder(reminder.id);
    _loadReminders();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã hủy lịch nhắc "${reminder.word}"')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lịch nhắc'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _reminders.isEmpty
              ? const Center(
                  child: Text(
                    'Chưa có lịch nhắc nào.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemCount: _reminders.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = _reminders[index];
                    final timeStr = DateFormat("HH:mm - dd/MM").format(item.remindAt);

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      leading: const Icon(
                        Icons.access_time,
                        color: Colors.black87,
                        size: 26,
                      ),
                      title: const Text(
                        'Ôn từ vựng mới!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${item.word} - ${item.meaning}\nNhắc lúc: $timeStr',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Color(0xFFE53935),
                          size: 22,
                        ),
                        onPressed: () => _deleteReminder(item),
                        tooltip: 'Hủy lịch nhắc',
                      ),
                    );
                  },
                ),
    );
  }
}
