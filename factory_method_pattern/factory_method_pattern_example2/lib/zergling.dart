import 'package:factory_method_pattern_example2/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Zergling implements Unit {
  @override
  Widget createImage() {
    return Image.asset('img/zerg.jpeg');
  }

  @override
  String getDescription() => "저그의 대표 유닛입니다.";
  @override
  String getName() => "저글링";

  @override
  String geteRace() => "저그";
}
