import 'package:flutter/material.dart';

class Experienceprovider extends ChangeNotifier {
  List<double> startOfAnimation = [1, 0, 0, 0, 0];
  void startLine(int i) {
    // for (int j = 0; j <= 4; j++) {
    //   startOfAnimation[j] = 0;
    // }

    startOfAnimation[i] = 1;
    // for (int j = i + 1; j <= 4; j++) {
    //   startOfAnimation[j] = 0;
    // }
    print(startOfAnimation);
    notifyListeners();
  }
}
