import 'package:flutter/material.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/controllers/task_controller.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/models/task.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;

  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late bool _isCompleted;
  final TaskController _taskController = TaskController();

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.task.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.task.title,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.task.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Completed',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Checkbox(
                    value: _isCompleted,
                    onChanged: (bool? value) async {
                      if (value != null) {
                        setState(() {
                          _isCompleted = value;
                          widget.task.isCompleted = _isCompleted;
                        });
                        await _taskController.updateTask(widget.task);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}