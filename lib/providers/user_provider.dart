import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _displayName;
  String? get displayName => _displayName;

  void setDisplayName(String? name) {
    _displayName = name;
    notifyListeners();
  }
} 