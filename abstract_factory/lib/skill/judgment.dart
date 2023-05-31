import '../skill.dart';

class Judgment implements Skill {
  @override
  String getName() => "판단";

  @override
  String getDescription() =>
      "가렌이 적을 향해 빠르게 검을 찌릅니다. 이 공격을 받은 적은 3초간 공격을 할 수 없습니다.";
}
