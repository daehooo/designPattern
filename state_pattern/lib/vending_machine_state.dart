import 'package:state_pattern/vending_machine.dart';

abstract class VendingMachineState {
  void insertCoin(VendingMachine vm);
  void ejectTicket(VendingMachine vm);
}
