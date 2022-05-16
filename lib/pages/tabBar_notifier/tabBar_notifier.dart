import 'package:flutter/material.dart';

class TabBarChangeProvider extends ChangeNotifier {
  bool isHomeSelected = true;
  bool isSearchSelected = false;
  double tabBodyHeight = 0.0;

  bool get getHomeSelected => isHomeSelected;

  bool get getSearchSelected => isSearchSelected;

  void setTabBarListener(int tab) {
    switch (tab) {
      case 0:
        isHomeSelected = true;
        isSearchSelected = false;
        break;
      case 1:
        isHomeSelected = false;
        isSearchSelected = true;
        break;
    }

    notifyListeners();
  }
}
