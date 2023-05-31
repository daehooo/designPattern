import 'package:abstract_factory/champion.dart';

class Darius implements Champion {
  @override
  String getDescription() => "다수의 적을 공격할 수 있는 파이터 챔피언 입니다.";
  @override
  String getName() => "다리우스";
}
