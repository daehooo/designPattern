import 'package:factory_method_pattern_example2/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Zealot implements Unit {
  @override
  Widget createImage() {
    return Image.asset('img/zealot.jpeg');
  }

  @override
  String getDescription() => "프로토스의 대표 유닛입니다.";
  @override
  String getName() => "질럿";

  @override
  String geteRace() => "프로토스";
}
