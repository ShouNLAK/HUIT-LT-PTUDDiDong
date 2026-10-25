import 'package:b10_nguyen_le_anh_khoa_2001240206/BTTL2/controllers/SinhVien_controller.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTTL2/models/SinhVien.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {

  @override
  _StudentScreen createState() => _StudentScreen();
}

class _StudentScreen extends State<StudentScreen> {
  final SinhvienController _controller = SinhvienController();
  List<SinhVien> _students = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    List<SinhVien> list;
    if (_searchQuery.isEmpty) {
      list = await _controller.fetch();
    } else {
      list = await _controller.search(_searchQuery);
    }
    setState(() {
      _students = list;
    });
  }

  void _showStudentDialog({SinhVien? student}) {
    final bool isEditing = student != null;
    final TextEditingController nameController =
        TextEditingController(text: isEditing ? student.name : '');
    final TextEditingController emailController =
        TextEditingController(text: isEditing ? student.email : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing
              ? 'Thông tin chi tiết của sinh viên'
              : 'Thêm sinh viên mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isEditing) ...[
                  Text('Dữ liệu: ${student.id} ${student.name}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 12),
                ],
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên Sinh Viên',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final email = emailController.text.trim();

                if (name.isEmpty || email.isEmpty) return;

                if (isEditing) {
                  final updatedStudent = SinhVien(
                    id: student.id,
                    name: name,
                    email: email,
                  );
                  await _controller.update(updatedStudent);
                } else {
                  final newStudent = SinhVien(name: name, email: email);
                  await _controller.insert(newStudent);
                }

                Navigator.pop(context);
                _loadStudents();
              },
              child: Text(isEditing ? 'Cập nhật' : 'Lưu'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteStudent(int id) async {
    await _controller.delete(id);
    _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý sinh viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
                _loadStudents();
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sinh viên...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                          _loadStudents();
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
              child: _students.isEmpty
                  ? const Center(child: Text('Không có sinh viên nào'))
                  : ListView.builder(
                      itemCount: _students.length,
                      itemBuilder: (context, index) {
                        final student = _students[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.grey[350],
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.school, color: Colors.blue),
                            ),
                            title: Text(
                              student.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0D1B2A),
                              ),
                            ),
                            subtitle: Text(student.email),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                if (student.id != null) {
                                  _deleteStudent(student.id!);
                                }
                              },
                            ),
                            onTap: () => _showStudentDialog(student: student),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showStudentDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}