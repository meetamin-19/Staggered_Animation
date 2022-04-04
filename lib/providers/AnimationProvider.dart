
import 'package:flutter/cupertino.dart';

class AnimationPro extends ChangeNotifier {
  bool isInPage2 = true;

  void changeBool()
  {
    isInPage2 = false;
    notifyListeners();
  }

  void reverseAnimation () {

  }

}