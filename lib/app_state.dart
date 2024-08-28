import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _companyName = 'Default Company';

  String get companyName => _companyName;

  void updateCompanyName(String newName) {
    _companyName = newName;
    notifyListeners();
  }
}
