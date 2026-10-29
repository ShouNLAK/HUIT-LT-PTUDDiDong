import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static Database ? _database;
  
  Future <Database?> _initDatabase() async {
    String path = await getDatabasesPath() + "app.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE TaiKhoan (
              tenDangNhap TEXT PRIMARY KEY,
              matKhau TEXT,
              doTuoi INTEGER,
              gioiTinh INTEGER
            )
          '''
        );

          await db.execute(
          '''
            CREATE TABLE Sach (
              maSach INTEGER PRIMARY KEY AUTOINCREMENT,
              tenSach TEXT
            )
          '''
        );

        await db.execute(
          '''
            CREATE TABLE LoaiSach (
              maLoai INTEGER PRIMARY KEY AUTOINCREMENT,
              tenLoai TEXT
            )
          '''
        );

        await db.execute(
          '''
            CREATE TABLE HoaDon (
              maHD INTEGER PRIMARY KEY AUTOINCREMENT,
              tenDangNhap TEXT,
              ngayMua DATETIME,
              tongTien REAL
            )
          '''
        );

        await db.execute(
          '''
            CREATE TABLE ChonSach (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              maSach INTEGER,
              soLuong INTEGER,
              giaBan REAL,
              maHD INTEGER,
              FOREIGN KEY(maSach) REFERENCES Sach(maSach),
              FOREIGN KEY(maHD) REFERENCES HoaDon(maHD)
            )
          '''
        );

        await db.execute("INSERT INTO TaiKhoan VALUES ('admin', '123', 20, 1)");
        await db.execute("INSERT INTO LoaiSach (maLoai, tenLoai) VALUES (1, 'Book')");
        await db.execute("INSERT INTO LoaiSach (maLoai, tenLoai) VALUES (2, 'Relax')");

        await db.execute("INSERT INTO Sach (tenSach) VALUES ('Lập trình hướng đối tượng')");
        await db.execute("INSERT INTO Sach (tenSach) VALUES ('Lập trình C')");
        await db.execute("INSERT INTO Sach (tenSach) VALUES ('Công nghệ .NET')");
        await db.execute("INSERT INTO Sach (tenSach) VALUES ('Tỉnh thức')");
        await db.execute("INSERT INTO Sach (tenSach) VALUES ('Đắc nhân tâm')");
      }
    );
  } 

  static final DatabaseHelper _instance = DatabaseHelper._int();
  DatabaseHelper._int();
  factory DatabaseHelper() =>  _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

}
  