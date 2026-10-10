import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD/NotificationService.dart';
import 'TaskModel.dart';
import 'TaskFileService.dart';
import 'AddTaskScreen.dart';

class BTVNScreen extends StatefulWidget {
  const BTVNScreen({super.key});

  @override
  State<BTVNScreen> createState() => _BTVNScreenState();
}

class _BTVNScreenState extends State<BTVNScreen> {
  final TaskFileService _fileService = TaskFileService();
  final NotificationService _notificationService = NotificationService();
  List<DailyTask> _tasks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _notificationService.init();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final list = await _fileService.loadTasks();
    setState(() {
      _tasks = list;
      _isLoading = false;
    });
  }

  Future<void> _onTaskCheckboxClicked(DailyTask task) async {
    if (!task.isCompleted) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text('Xác nhận', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            content: const Text('Bạn có xác nhận nhiệm vụ này đã hoàn thành ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Xác nhận', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        task.isCompleted = true;
        await _fileService.updateTask(task);
        _loadTasks();
        final completedCount = _tasks.where((t) => t.isCompleted).length;
        await _notificationService.showSimpleNotification(
          8888,
          'task_completed_channel',
          'Nhiệm vụ hoàn thành',
          'Tiến độ nhiệm vụ',
          'Bạn đã hoàn thành $completedCount nhiệm vụ!',
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã hoàn thành! Tổng cộng: $completedCount nhiệm vụ.')),
        );
      }
    } else {
      task.isCompleted = false;
      await _fileService.updateTask(task);
      _loadTasks();
    }
  }

  Future<void> _setupNotificationForTask(DailyTask task) async {
    final now = DateTime.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: task.reminderTime != null
          ? TimeOfDay.fromDateTime(task.reminderTime!)
          : TimeOfDay.now(),
    );

    if (pickedTime != null) {
      DateTime scheduledDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      if (scheduledDateTime.isBefore(now)) {
        scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
      }

      task.reminderTime = scheduledDateTime;
      await _fileService.updateTask(task);
      await _notificationService.scheduleNotificationDateTime(
        id: task.id,
        scheduleTime: scheduledDateTime,
        channelId: 'task_reminder_channel',
        channelName: 'Nhắc việc',
        title: 'Nhắc việc: ${task.title}',
        body: 'Đến giờ thực hiện: ${task.title}',
      );

      _loadTasks();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Đã đặt lịch nhắc cho "${task.title}" lúc ${DateFormat("HH:mm").format(scheduledDateTime)}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Nhiệm vụ mỗi ngày',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined, size: 22),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Hôm nay là: ${DateFormat("dd/MM/yyyy").format(DateTime.now())}')),
              );
            },
            tooltip: 'Lịch',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _tasks.isEmpty
              ? const Center(
                  child: Text(
                    'Chưa có nhiệm vụ nào. Bấm nút + để thêm mới!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final item = _tasks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3F6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => _onTaskCheckboxClicked(item),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: item.isCompleted ? const Color(0xFF2196F3) : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: item.isCompleted ? const Color(0xFF2196F3) : Colors.grey.shade400,
                                  width: 1.5,
                                ),
                              ),
                              child: item.isCompleted
                                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: item.isCompleted ? Colors.grey : Colors.black87,
                                    decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Nhắc lúc ${item.formattedReminderTime}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              item.reminderTime != null ? Icons.notifications_active_outlined : Icons.notifications_none,
                              size: 22,
                              color: item.reminderTime != null ? Colors.blue.shade700 : Colors.grey.shade600,
                            ),
                            onPressed: () => _setupNotificationForTask(item),
                            tooltip: 'Thiết lập thời gian thông báo',
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
          if (result == true) {
            _loadTasks();
          }
        },
        backgroundColor: const Color(0xFFDCE8F5),
        elevation: 1,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Color(0xFF4A5568), size: 28),
      ),
    );
  }
}

