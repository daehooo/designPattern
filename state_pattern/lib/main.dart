import 'package:state_pattern/vending_machine.dart';
import 'package:state_pattern/vending_machine_state.dart';

void main() {
  final VendingMachine vm = VendingMachine();

  vm.ejectTicket();

  vm.insertCoin();
  vm.ejectTicket();

  vm.insertCoin();
  vm.insertCoin();
  vm.ejectTicket();
}
