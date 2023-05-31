import 'package:abstract_factory/champion.dart';
import 'package:abstract_factory/role_factory.dart';
import 'package:abstract_factory/skill.dart';
import 'package:abstract_factory/skill/charm.dart';
import 'package:abstract_factory/skill/final_spark.dart';

import '../champion/ahri.dart';
import '../champion/lux.dart';

class MageFactory implements RoleFactory {
  @override
  Champion createChampion(String championName) {
    // 유효성검사를 할때엔, enum Type

    if (championName == "아리") {
      return Ahri();
    } else if (championName == "럭스") {
      return Lux();
    } else {
      throw Exception("${championName}은 없습니다.");
    }
  }

  @override
  Skill createSkill(String skillName) {
    if (skillName == "매혹") {
      return Charm();
    } else if (skillName == "스파크 광선") {
      return FinalSpark();
    } else {
      throw Exception("${skillName}은 없습니다.");
    }
  }
}
