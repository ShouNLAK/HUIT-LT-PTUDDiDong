import 'package:flutter/material.dart';

class Service {
  String _title;
  IconData _icon;
  Color _iconColor;
  String? _imagePath;

  Service({
    required String title,
    required IconData icon,
    required Color iconColor,
    String? imagePath,
  })  : _title = title,
        _icon = icon,
        _iconColor = iconColor,
        _imagePath = imagePath;

  String get getTitle => _title;
  IconData get getIcon => _icon;
  Color get getIconColor => _iconColor;
  String? get getImagePath => _imagePath;
}
