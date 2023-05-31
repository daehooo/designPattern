import 'package:command_pattern/provider/light.dart';

import 'icommand.dart';

class LightOffCommand implements ICommand {
  Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.off();
  }

  @override
  void undo() {
    light.on();
  }
}
