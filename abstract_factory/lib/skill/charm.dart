import '../skill.dart';

class Charm implements Skill {
  @override
  String getName() => "매혹";

  @override
  String getDescription() => "아리가 적을 향해 매혹을 날립니다. 적은 3초간 아리를 향해 다가옵니다. ";
}
