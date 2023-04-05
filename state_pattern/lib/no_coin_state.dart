import 'package:state_pattern/vending_machine.dart';
import 'package:state_pattern/vending_machine_state.dart';

import 'has_coin_state.dart';

class NoCoinState implements VendingMachineState {
  @override
  void insertCoin(VendingMachine vm) {
    print('동전이 투입되었습니다.');
    vm.state = HasCoinState(); // 동전이 투입되면 HasCoinState로 상태 변경
  }

  @override
  void ejectTicket(VendingMachine vm) {
    print('동전을 투입해주세요.');
  }
}
