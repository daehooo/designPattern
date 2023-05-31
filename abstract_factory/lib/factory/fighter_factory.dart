import 'package:abstract_factory/champion/darius.dart';
import 'package:abstract_factory/skill.dart';

import 'package:abstract_factory/champion.dart';
import 'package:abstract_factory/skill/judgment.dart';
import 'package:abstract_factory/skill/noxian_guillotine.dart';

import '../champion/garen.dart';
import '../role_factory.dart';

class FighterFactory implements RoleFactory {
  @override
  Champion createChampion(String championName) {
    if (championName == "가렌") {
      return Garen();
    } else if (championName == "다리우스") {
      return Darius();
    } else
      throw Exception("존재하지 않는 ${championName}입니다.");
  }

  @override
  Skill createSkill(String skillName) {
    if (skillName == "판단") {
      return Judgment();
    } else if (skillName == "녹서스 단두대") {
      return NoxianGuillotine();
    } else
      throw Exception("존재하지 않는 ${skillName}입니다.");
  }
}
