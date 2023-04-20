import 'package:flutter/material.dart';

class CardHomeController extends ChangeNotifier {
  bool isButtonPressed = false;

  void buttonPressed() {
    if (isButtonPressed == false) {
      isButtonPressed = true;
    } else if (isButtonPressed == true) {
      isButtonPressed = false;
    }
    notifyListeners();
  }
}
