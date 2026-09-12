import 'package:flutter/material.dart';

class Voucher {
  String _provider;
  String _title;
  String _description;
  String _expiry;
  String _actionText;
  bool _isFavorite;
  IconData _iconData;
  Color _iconColor;
  bool _isThuThap;

  Voucher({
    required String provider,
    required String title,
    required String description,
    required String expiry,
    required String actionText,
    required bool isFavorite,
    required IconData iconData,
    required Color iconColor,
    bool isThuThap = false,
  })  : _provider = provider,
        _title = title,
        _description = description,
        _expiry = expiry,
        _actionText = actionText,
        _isFavorite = isFavorite,
        _iconData = iconData,
        _iconColor = iconColor,
        _isThuThap = isThuThap;

  String get getProvider => _provider;
  String get getTitle => _title;
  String get getDescription => _description;
  String get getExpiry => _expiry;
  String get getActionText => _actionText;
  bool get getIsFavorite => _isFavorite;
  IconData get getIconData => _iconData;
  Color get getIconColor => _iconColor;
  bool get getIsThuThap => _isThuThap;
}
