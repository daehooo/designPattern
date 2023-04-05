import 'package:state_pattern/vending_machine.dart';
import 'package:state_pattern/vending_machine_state.dart';

import 'no_coin_state.dart';

class HasCoinState implements VendingMachineState {
  @override
  void insertCoin(VendingMachine vm) {
    print('이미 동전이 투입되었습니다.');
  }

  @override
  void ejectTicket(VendingMachine vm) {
    print('티켓이 출력되었습니다.');
    vm.state = NoCoinState(); // 티켓이 출력되면 NoCoinState로 상태 변경
  }
}
