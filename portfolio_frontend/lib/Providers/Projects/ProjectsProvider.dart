import 'package:flutter/material.dart';
import 'package:portfolio/globals.dart';

class ProjectsProvider extends ChangeNotifier {
  Color bttnClr = globals.transparent;
  // void hoverButton()
  // {
  //   bttnClr = globals.brownish;
  //   notifyListeners();
  // }

  bool isHovered = false;
  void changeHover(value) {
    isHovered = value;
    notifyListeners();
  }
}
