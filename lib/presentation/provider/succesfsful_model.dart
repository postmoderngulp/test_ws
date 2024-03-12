import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SuccessfulModel extends ChangeNotifier {
   double angle = 0.0;
    List<bool> stars = [false, false, false, false, false];
    bool _valRate = false;


  SuccessfulModel(){
    _setup();
  }

  
  void setStar() {
    for (int i = 0; i < stars.length; i++) {
      if (stars[i] == false) {
        stars[i] = true;
        notifyListeners();
        return;
      }
    }
  }

  void deleteStar() {
    for (int i = 0; i < stars.length; i++) {
      if (stars[i] == false) {
        i == 0 ? null : stars[i - 1] = false;
        notifyListeners();
        return;
      } else if (stars[stars.length - 1] == true) {
        stars[stars.length - 1] = false;
        notifyListeners();
        return;
      }
       
    }
  }



  void _setup(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(angle == 5) return;
      angle += 1;
      notifyListeners();
    });
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        if (event.y <= 0.15 && event.y >= -0.15) {
          _valRate = true;
        }
        if (_valRate) {
          if (event.y >= 0.56) {
            setStar();
            _valRate = false;
          } else if (event.y <= -0.56) {
            deleteStar();
            _valRate = false;
          }
        }
      },
    );
  }
}