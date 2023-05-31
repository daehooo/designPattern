import 'package:flutter/material.dart';

import '../enum/light_state.dart';

class Light extends ChangeNotifier {
  LightState _state = LightState.off;

  LightState get state => _state;
  void on() {
    _state = LightState.on;
    print('Light is ON');
    notifyListeners();
  }

  void off() {
    _state = LightState.off;
    print('Light is OFF');
    notifyListeners();
  }
}
