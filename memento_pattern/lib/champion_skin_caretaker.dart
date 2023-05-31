import 'champion_skin_memento.dart';
import 'champion_skin_originator.dart';

// ChampionSkinOriginator의 상태를 관리하는 클래스입니다.
// save() 메서드를 사용하여 현재 상태를 저장하고,
// undo()와 redo() 메서드를 사용하여
// 이전 상태로 되돌리거나 되돌린 상태를 다시 적용합니다.

// 메멘토 패턴의 관리자 역할을 하는 'ChampionSkinCaretaker'
// 사용자가 스킨을 변경할 때마다 변경 이력을 관리하고, undo 및 redo 기능을 제공
class ChampionSkinCaretaker {
  final ChampionSkinOriginator originator;

  // 변경 이력을 저장하는 객체리스트인 history 선언
  final List<ChampionSkinMemento> history = [];
  // 현재 선택된 스킨의 인덱스 저장
  int currentPosition = -1;

  // 생성자 생성
  ChampionSkinCaretaker(this.originator);

  // 사용자가 스킨을 변경할 때 호출되는 함수.
  // originator.createMemento() 를 호출해 현재 상태를 메멘토에 저장하고, 이를 history에 추가
  void save() {
    if (currentPosition < history.length - 1) {
      // 현재 위치가 이력의 마지막이 아닌 경우, 현재 위치 이후의 이력을 삭제합니다.
      history.removeRange(currentPosition + 1, history.length);
    }
    // originator.createMemento()를 호출해 현재 상태를 메멘토로 저장하고, 이를 history에 추가
    history.add(originator.createMemento());
    // currentPosition을 증가시켜 새로운 위치 반영
    currentPosition++;
  }

  // 이전 상태를 되돌리는 함수
  void undo() {
    if (currentPosition > 0) {
      currentPosition--;
      // originator.restoreMemento(history[currentPosition])를 호출해 이전 상태를 복원합니다.
      originator.restoreMemento(history[currentPosition]);
    }
  }

  void redo() {
    // currentPosition이 이력의 마지막이 아닌 경우, 다음 동작을 수행
    if (currentPosition < history.length - 1) {
      // 값 증가
      currentPosition++;
      // originator.restoreMemento(history[currentPosition])를 호출해 다음 상태를 복원합니다
      originator.restoreMemento(history[currentPosition]);
    }
  }
}
