import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/controllers/task_controller.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/models/task.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/views/task_detail.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> _tasks = [];
  final TaskController _taskController = TaskController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final TextEditingController _searchQuery = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final tasks = await _taskController.fetchTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.titleMedium!;
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onTap: () => {},
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onTap: () => {},
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Task newTask = Task(
                        id: _tasks.isNotEmpty ? _tasks.last.id + 1 : 1,
                        title: titleController.text,
                        description: descriptionController.text,
                      );
                      _taskController.insertTask(newTask).then((_) {
                        _fetchTasks();
                        descriptionController.clear();
                        titleController.clear();
                      });
                    },
                    child: Text('Add Task'),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_tasks.isNotEmpty) {
                        Task lastTask = _tasks.last;
                        _taskController.deleteTask(lastTask.id).then((_) {
                          _fetchTasks();
                        });
                      }
                    },
                    child: Text("Delete Task"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    color: task.isCompleted ? Colors.green[100] : Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetailScreen(task: task),
                            ),
                          );
                          _fetchTasks();
                        },
                      ),
                      onTap: () {
                        setState(() {
                          titleController.text = task.title;
                          descriptionController.text = task.description;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}