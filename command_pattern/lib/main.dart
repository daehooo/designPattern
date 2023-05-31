import 'package:command_pattern/light_off_command.dart';
import 'package:command_pattern/provider/light.dart';
import 'package:command_pattern/remote_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'enum/light_state.dart';
import 'light_on_command.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Light(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Light Control')),
          body: LightControl(),
        ),
      ),
    );
  }
}

class LightControl extends StatelessWidget {
  final RemoteControl remoteControl = RemoteControl();

  @override
  Widget build(BuildContext context) {
    Light light = context.read<Light>().state as Light;
    LightOnCommand lightOn = LightOnCommand(light);
    LightOffCommand lightOff = LightOffCommand(light);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'The light is ${light.state == LightState.on ? "ON" : "OFF"}',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                remoteControl.setCommand(lightOn);
                remoteControl.pressButton();
              },
              child: Text('Turn ON'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                remoteControl.setCommand(lightOff);
                remoteControl.pressButton();
              },
              child: Text('Turn OFF'),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            remoteControl.pressUndo();
          },
          child: Text('UNDO'),
        ),
      ],
    );
  }
}
