import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
 
  get navigatorvalue => _navigatorValue;
  
 Widget _currentScreen = HomeScreen();
  get currentScreen => _currentScreen;

  void changeNavigatorValue(int selectedNavigator) {
    _navigatorValue = selectedNavigator;
    switch (selectedNavigator) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CartView();
        break;
      case 2:
        _currentScreen = ProfileView();
        break;
    }

    update();
  }
}
