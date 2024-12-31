import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String scrollDirection = "upward";
  double x=0;
  double visibilityValue = 0;
  bool isHovered =false;
  void changeVisibility() {
    notifyListeners();
  }
  void changeHover(value){
    isHovered = value;
    notifyListeners();
  }
}
