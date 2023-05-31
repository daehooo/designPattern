import 'champion_skin_memento.dart';

// 상태를 저장하고 복원할 객체
class ChampionSkinOriginator {
  String skinUrl;

  ChampionSkinOriginator(this.skinUrl);

  // 현재 상태를 ChampionSkinMemento 객체로 저장
  ChampionSkinMemento createMemento() {
    return ChampionSkinMemento(skinUrl);
  }

  // 이전 상태 복원
  void restoreMemento(ChampionSkinMemento memento) {
    skinUrl = memento.skinUrl;
  }
}
