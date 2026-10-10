import 'package:intl/intl.dart';

class DailyTask {
  final int id;
  String title;
  DateTime? reminderTime;
  bool isCompleted;

  DailyTask({
    required this.id,
    required this.title,
    this.reminderTime,
    this.isCompleted = false,
  });

  String get formattedReminderTime {
    if (reminderTime == null) return "Chưa đặt giờ nhắc";
    return DateFormat("HH:mm").format(reminderTime!);
  }

  String toFileString() {
    final timeStr = reminderTime != null ? reminderTime!.toIso8601String() : "";
    return "$id|$title|$timeStr|$isCompleted";
  }

  static DailyTask fromString(String line) {
    final parts = line.split("|");
    final id = int.parse(parts[0]);
    final title = parts[1];
    DateTime? reminderTime;
    if (parts.length > 2 && parts[2].isNotEmpty) {
      reminderTime = DateTime.tryParse(parts[2]);
    }
    bool isCompleted = false;
    if (parts.length > 3) {
      isCompleted = parts[3].toLowerCase() == 'true';
    }
    return DailyTask(
      id: id,
      title: title,
      reminderTime: reminderTime,
      isCompleted: isCompleted,
    );
  }
}
