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
            user TEXT PRIMARY KEY,
            pass TEXT NOT NULL,
            hoVaTen TEXT NOT NULL,
            soDienThoai TEXT NOT NULL
          )
          '''
        );

        await db.execute(
          '''
          CREATE TABLE LoaiNongSan (
            maLoai TEXT PRIMARY KEY,
            tenLoai TEXT NOT NULL
          )
          '''
        );

        await db.execute(
          '''
          CREATE TABLE NongSan (
            maNS TEXT PRIMARY KEY,
            tenNS TEXT NOT NULL,
            maLoai INTEGER NOT NULL,
            giaBan REAL NOT NULL,
            donViTinh TEXT NOT NULL,
            moTa TEXT NOT NULL,
            hinhAnh TEXT NOT NULL,
            FOREIGN KEY (maLoai) REFERENCES LoaiNongSan(maLoai)
          )
          '''
        );

        await db.execute(
          '''
          CREATE TABLE HoaDon (
            maHD INTEGER PRIMARY KEY AUTOINCREMENT,
            user TEXT NOT NULL,
            ngayLap TEXT NOT NULL,
            tongTien REAL NOT NULL,
            FOREIGN KEY (user) REFERENCES TaiKhoan(user)
          )
          '''
        );

        await db.execute(
          '''
          CREATE TABLE ChiTietHoaDon (
            maHD INTEGER NOT NULL,
            maNS TEXT NOT NULL,
            soLuong INTEGER NOT NULL,
            giaBan REAL NOT NULL,
            PRIMARY KEY (maHD, maNS),
            FOREIGN KEY (maHD) REFERENCES HoaDon(maHD),
            FOREIGN KEY (maNS) REFERENCES NongSan(maNS)
          )
          '''
        );

        await db.execute(
          '''
          INSERT INTO TaiKhoan (user, pass, hoVaTen, soDienThoai)
          VALUES 
          ('admin','123456','Quản trị','0900000001'),
          ('khach01', '123456','Khách mẫu', '0900000002')
          '''
        );

        await db.execute(
          '''
          INSERT INTO LoaiNongSan (maLoai, tenLoai)
          VALUES ('L01', 'Rau củ'),
          ('L02', 'Trái cây'),
          ('L03','Thực phẩm hữu cơ')
          '''
        );

        await db.execute(
          '''
          INSERT INTO NongSan (maNS, tenNS, maLoai, giaBan, donViTinh, moTa, hinhAnh)
          VALUES ('NS01', 'Cải xanh', 'L01', 18000, 'kg', 'Đây là cải xanh', 'caixanh.png'),
          ('NS02', 'Cà rốt', 'L01', 24000, 'kg', 'Đây là cà rốt', 'carot.png'),
          ('NS03', 'Cam sành', 'L02', 35000, 'kg', 'Đây là cam sành', 'cam.png'),
          ('NS04', 'Chuối già', 'L02', 22000, 'kg', 'Đây là chuối già', 'chuoi.png'),
          ('NS05', 'Gạo hữu cơ', 'L03', 42000, 'kg', 'Đây là gạo hữu cơ', 'gao.png'),
          ('NS06', 'Trứng hữu cơ', 'L03', 38000, 'hộp', 'Đây là trứng', 'caixanh.png')
          '''
        );
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
  