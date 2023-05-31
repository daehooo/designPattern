import 'package:abstract_factory/champion.dart';
import 'package:abstract_factory/skill.dart';

abstract class RoleFactory {
  Champion createChampion(String championName);
  Skill createSkill(String skillName);
}
