import 'package:factory_method_pattern_example2/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Marine implements Unit {
  @override
  Widget createImage() {
    return Image.asset('img/marine.png');
  }

  @override
  String getDescription() => "테란의 대표 유닛입니다.";
  @override
  String getName() => "마린";

  @override
  String geteRace() => "테란";
}
