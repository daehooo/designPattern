import 'package:state_pattern/vending_machine_state.dart';
import 'no_coin_state.dart';

class VendingMachine {
  // late선언한 이유는 state의 값이 뒤에 선언될 수도 있기 때문
  late VendingMachineState state; // 현재 자판기의 상태
  // 생성자
  VendingMachine() {
    state = NoCoinState(); // 처음 상태는 동전이 없는 상태로 초기화
  }

  void insertCoin() {
    state.insertCoin(this); // 현재 상태에 따라 insertCoin 메소드 호출
  }

  void ejectTicket() {
    state.ejectTicket(this); // 현재 상태에 따라 ejectTicket 메소드 호출
  }
}
