import 'package:flutter/foundation.dart';

class BrandSelectionNotifier extends ChangeNotifier {
  String _selectedBrand = '';

  String get selectedBrand => _selectedBrand;

  void setSelectedBrand(String brand) {
    _selectedBrand = brand;
    notifyListeners();
  }
}
