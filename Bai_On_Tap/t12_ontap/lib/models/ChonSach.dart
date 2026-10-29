import 'package:flutter/material.dart';

class ChonSach {
  int id;
  String maSach;
  int soLuong;
  double giaBan;
  int maHD;

  ChonSach({
    required this.id,
    required this.maSach,
    required this.soLuong,
    required this.giaBan,
    required this.maHD
  });

  Map<String,dynamic> toMap() {
    return {
      'id' : id,
      'maSach' : maSach,
      'soLuong' : soLuong,
      'giaBan' : giaBan,
      'maHD' : maHD
    };
  }

  factory ChonSach.fromMap(Map<String,dynamic> maps) {
    return ChonSach(
      id: maps['id'], 
      maSach: maps['maSach'], 
      soLuong: maps['soLuong'], 
      giaBan: maps['giaBan'], 
      maHD: maps['maHD']
      );
  }
}