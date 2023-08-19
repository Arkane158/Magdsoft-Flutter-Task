import 'package:flutter/foundation.dart';

/// BrandSelectionNotifier - ChangeNotifier for Brand Selection
///
/// This class handles the selected brand state and notifies listeners about changes.
class BrandSelectionNotifier extends ChangeNotifier {
  String _selectedBrand = 'All';

  /// Getter for the selected brand.
  String get selectedBrand => _selectedBrand;

  /// Sets the selected brand and notifies listeners.
  ///
  /// Parameters:
  ///   - brand: The brand to set as selected.
  void setSelectedBrand(String brand) {
    _selectedBrand = brand;
    notifyListeners();
  }
}
