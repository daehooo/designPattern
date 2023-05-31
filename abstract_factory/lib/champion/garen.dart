import 'package:abstract_factory/champion.dart';

class Garen implements Champion {
  @override
  String getDescription() => "근접 공격을 하는 멋진 전사입니다.";
  @override
  String getName() => "가렌";
}
