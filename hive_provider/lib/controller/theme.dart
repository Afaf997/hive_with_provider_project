import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier{
  bool _ifMode = false;

  get ifDark => _ifMode;

darkThemeModel() {
    _ifMode = !_ifMode;

    notifyListeners();
  }
}