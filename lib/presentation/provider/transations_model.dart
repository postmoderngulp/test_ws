import 'dart:async';

import 'package:flutter/material.dart';

class TransactonsModel extends ChangeNotifier {
  double angle = 0.0;
  TransactonsModel(){
    _setup();
  }

  void _setup(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(angle == 5) return;
      angle += 1;
      notifyListeners();
    });
  }
}