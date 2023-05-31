import 'package:command_pattern/provider/light.dart';

import 'icommand.dart';

class LightOnCommand implements ICommand {
  Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.on();
  }

  @override
  void undo() {
    light.off();
  }
}
