import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN2/models/User.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN2/utils/database_helper.dart';

class UserController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> insert(User user) async {
    final db = await _dbHelper.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> login(String email, String password) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<bool> isEmailExist(String email) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return maps.isNotEmpty;
  }

  Future<List<User>> fetch() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return maps.map((obj) => User.fromMap(obj)).toList();
  }

  Future<void> delete(int id) async {
    final db = await _dbHelper.database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
