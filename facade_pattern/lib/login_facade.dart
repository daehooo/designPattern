import 'package:flutter/material.dart';

class LoginFacade {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;

  bool validate() {
    // 둘중 하나라도 비어있다면,
    // false,
    // 모두 입력이 되었다면, Login 성공

    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }
}
