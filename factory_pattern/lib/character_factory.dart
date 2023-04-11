import 'character.dart';
import 'character_type.dart';

class CharacterFactory {
  static Character createCharacter(CharacterType type,
      {required String name, required int level}) {
    switch (type) {
      case CharacterType.Warrier:
        return Character(job: "전사", name: name, level: level);
      case CharacterType.Archer:
        return Character(job: "궁수", name: name, level: level);
      case CharacterType.Mage:
        return Character(job: "마법사", name: name, level: level);
      default:
        throw ArgumentError("잘못된 캐릭터 입니다.");
    }
  }
}
