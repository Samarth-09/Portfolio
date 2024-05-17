import 'package:flutter/material.dart';
import 'package:portfolio/screens/home.dart';

class LandingProvider extends ChangeNotifier {
  int currentIndex = 0;
  List currentScreen = [home];
  void changeScreen(int idx) {
    currentIndex = idx;
    notifyListeners();
  }
}
