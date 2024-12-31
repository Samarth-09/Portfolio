import 'package:flutter/material.dart';

class SkillsProvider extends ChangeNotifier{
  // bool prev = false;
  bool isTaped = false;
  void changeTaped() {
    // prev = isHovered; 
    isTaped = !isTaped;
    notifyListeners();
  }
}