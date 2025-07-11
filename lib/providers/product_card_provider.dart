import 'package:flutter/material.dart';

class ProductCardProvider extends ChangeNotifier {
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  void select(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
} 