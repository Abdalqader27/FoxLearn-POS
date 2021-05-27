import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState>? scaffoldKey;
  PageController? _pageController;

  int _pageIndex = 0;

  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  set pageController(PageController? value) => _pageController = value;

  int get pageIndex => _pageIndex;

  jumpToPage(int index) {
    _pageController!.jumpToPage(index);
    pageIndex = index;
  }
}
