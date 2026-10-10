import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'TaskModel.dart';

class TaskFileService {
  Future<String> get _path async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _file async {
    final path = await _path;
    return File('$path/btvn_daily_tasks.txt');
  }

  Future<void> saveTasks(List<DailyTask> tasks) async {
    final file = await _file;
    String data = tasks.map((e) => e.toFileString()).join("\n");
    await file.writeAsString(data);
  }

  Future<List<DailyTask>> loadTasks() async {
    try {
      final file = await _file;
      if (!await file.exists()) {
        final now = DateTime.now();
        final sampleTime = DateTime(now.year, now.month, now.day, 20, 0);
        final defaultTasks = [
          DailyTask(id: 1, title: 'Học bài chương 4', reminderTime: sampleTime),
          DailyTask(id: 2, title: 'Học bài chương 4', reminderTime: sampleTime),
          DailyTask(id: 3, title: 'Học bài chương 4', reminderTime: sampleTime),
          DailyTask(id: 4, title: 'Học bài chương 4', reminderTime: sampleTime),
          DailyTask(id: 5, title: 'Học bài chương 4', reminderTime: sampleTime),
        ];
        await saveTasks(defaultTasks);
        return defaultTasks;
      }

      final content = await file.readAsString();
      return content
          .split("\n")
          .where((e) => e.trim().isNotEmpty)
          .map((e) => DailyTask.fromString(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addTask(DailyTask task) async {
    final tasks = await loadTasks();
    tasks.add(task);
    await saveTasks(tasks);
  }

  Future<void> updateTask(DailyTask task) async {
    final tasks = await loadTasks();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
      await saveTasks(tasks);
    }
  }

  Future<void> deleteTask(int id) async {
    final tasks = await loadTasks();
    tasks.removeWhere((t) => t.id == id);
    await saveTasks(tasks);
  }
}
