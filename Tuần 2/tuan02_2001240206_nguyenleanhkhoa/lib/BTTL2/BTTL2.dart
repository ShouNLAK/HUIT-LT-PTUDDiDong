import 'dart:io';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/DoAn.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/LyThuyet.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/MonHoc.dart';
import 'package:tuan02_2001240206_nguyenleanhkhoa/BTTL2/ThucHanh.dart';

Future<void> docFile(List<MonHoc> ds, String fileName) async {
  try {
    List<String> lines = await File(fileName).readAsLines();
    for (String line in lines) {
      List<String> parts = line.split('#');
      if (parts.length >= 6) {
        int loai = int.parse(parts[0].trim());
        String ma = parts[1].trim(), ten = parts[2].trim();
        int tc = int.parse(parts[3].trim());

        if (loai == 1) {
          ds.add(LyThuyet.full(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5])));
        } else if (loai == 2) {
          ds.add(ThucHanh.full(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5]), double.parse(parts[6])));
        } else if (loai == 3) {
          ds.add(DoAn.full(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5])));
        }
      }
    }
    print("-> Đã đọc ${ds.length} môn học từ file '$fileName'.");
  } catch (e) {
    print("-> Lỗi đọc file hoặc file không tồn tại: $e");
  }
}

void nhapTuBanPhim(List<MonHoc> ds) {
  stdout.write('\nNhập số lượng môn học muốn thêm từ bàn phím: ');
  int n = int.parse(stdin.readLineSync() ?? '0');
  
  for (int i = 0; i < n; i++) {
    print('\nNhập thông tin môn thứ ${i + 1}:');
    stdout.write('Loại môn (1: Lý thuyết, 2: Thực hành, 3: Đồ án): ');
    int loai = int.parse(stdin.readLineSync() ?? '1');
    
    stdout.write('Mã môn: '); String ma = stdin.readLineSync() ?? '';
    stdout.write('Tên môn: '); String ten = stdin.readLineSync() ?? '';
    stdout.write('Số tín chỉ: '); int tc = int.parse(stdin.readLineSync() ?? '0');

    if (loai == 1) {
      stdout.write('Điểm tiểu luận: '); double dtl = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm cuối kỳ: '); double dck = double.parse(stdin.readLineSync() ?? '0');
      ds.add(LyThuyet.full(ma, ten, tc, dtl, dck));
    } else if (loai == 2) {
      stdout.write('Điểm KT1: '); double kt1 = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm KT2: '); double kt2 = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm KT3: '); double kt3 = double.parse(stdin.readLineSync() ?? '0');
      ds.add(ThucHanh.full(ma, ten, tc, kt1, kt2, kt3));
    } else if (loai == 3) {
      stdout.write('Điểm GVHD: '); double hd = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm GVPB: '); double pb = double.parse(stdin.readLineSync() ?? '0');
      ds.add(DoAn.full(ma, ten, tc, hd, pb));
    }
  }
}

void xuatDanhSach(List<MonHoc> ds, String thongBao) {
  for (var mon in ds) {
    mon.showInfo();
  }
}

void kiemTraSapXepTheoTen(List<MonHoc> ds) {
  bool isSorted = true;
  for (int i = 0; i < ds.length - 1; i++) {
    if (ds[i].tenMH.compareTo(ds[i + 1].tenMH) > 0) {
      isSorted = false;
      break;
    }
  }
  print('Danh sách có được sắp xếp tăng dần : ${isSorted ? "CÓ" : "KHÔNG"}');
}

void inMonHocTinChiCaoNhat(List<MonHoc> ds) {
  if (ds.isEmpty) return;
  int maxTC = ds.map((m) => m.soTC).reduce((a, b) => a > b ? a : b);
  ds.where((m) => m.soTC == maxTC).forEach((m) => m.showInfo());
}

void timVaThemMonHoc(List<MonHoc> ds) {
  stdout.write('Nhập tên môn học cần tìm: ');
  String tenTim = stdin.readLineSync() ?? '';
  
  List<MonHoc> ketQua = ds.where((m) => m.tenMH.toLowerCase() == tenTim.toLowerCase()).toList();
  
  if (ketQua.isNotEmpty) {
    for (var m in ketQua) 
      m.showInfo();
  } else {
    print('-> Không tìm thấy "$tenTim". Tiến hành thêm vào danh sách:');
    stdout.write('Mã môn: '); 
    String ma = stdin.readLineSync() ?? '';
    stdout.write('Số tín chỉ: '); 
    int tc = int.parse(stdin.readLineSync() ?? '0');
    stdout.write('Loại môn (1: Lý thuyết, 2: Thực hành, 3: Đồ án): ');
    int loai = int.parse(stdin.readLineSync() ?? '1');
    if (loai == 1) {
      stdout.write('Điểm tiểu luận: '); double dtl = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm cuối kỳ: '); double dck = double.parse(stdin.readLineSync() ?? '0');
      ds.add(LyThuyet.full(ma, tenTim, tc, dtl, dck));
    } else if (loai == 2) {
      stdout.write('Điểm KT1: '); double kt1 = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm KT2: '); double kt2 = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm KT3: '); double kt3 = double.parse(stdin.readLineSync() ?? '0');
      ds.add(ThucHanh.full(ma, tenTim, tc, kt1, kt2, kt3));
    } else if (loai == 3) {
      stdout.write('Điểm GVHD: '); double hd = double.parse(stdin.readLineSync() ?? '0');
      stdout.write('Điểm GVPB: '); double pb = double.parse(stdin.readLineSync() ?? '0');
      ds.add(DoAn.full(ma, tenTim, tc, hd, pb));
    }
    print('-> Đã thêm môn "$tenTim" thành công!');
  }
}

void tinhTinChiTrungBinh(List<MonHoc> ds) {
  int tongTC = ds.fold(0, (sum, mh) => sum + mh.soTC);
  double tb = tongTC / ds.length;
  print('\n-> Số tín chỉ trung bình của danh sách: $tb');
}

void HienThi()
{
  print("1. Nhập vào danh sách môn học (Thủ công)");
  print("2. Xuất danh sách");
  print("3. Kiểm tra danh sách nếu được xếp theo tên môn học tăng dần");
  print("4. Sắp xếp môn học theo tín chỉ tăng dần");
  print("5. Môn có số tín chỉ cao nhất");
  print("6. Tìm và thêm môn cuối danh sách");
  print("7. Nhập môn học vào danh sách bằng file");
  print("8. Tính số tín chỉ trung bình trong danh sách");
  print("--------------------------------------------------------");
  print("0. Thoát chương trình");
}