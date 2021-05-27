import 'dart:async';

import 'package:flutter/cupertino.dart';

class TabBarProvider extends ChangeNotifier {
  int _pageIndex;

  bool _disable = false;

  TabBarProvider() : _pageIndex = 0;

  int get pageIndex => _pageIndex;

  bool get disable => _disable;

  set pageIndex(int value) {
    disable = true;
    notifyListeners();
    _pageIndex = value;
    Timer(Duration(milliseconds: 400), () {
      disable = false;
    });
  }

  set disable(bool value) {
    _disable = value;
    notifyListeners();
  }
}
