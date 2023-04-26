import 'package:flutter/material.dart';
void main() {
      runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Command Pattern 예제')),
        body: Center(child: TextChanger()),
      ),
    );
  }
}

class TextChanger extends StatefulWidget {
  @override
  _TextChangerState createState() => _TextChangerState();
}

class _TextChangerState extends State<TextChanger> {
  Color _textColor = Colors.black;
  double _textSize = 24;

      // 리모컨 역할 실행
  final RemoteControl remote = RemoteControl();

  void _changeTextColor() {
    setState(() {
      _textColor = _textColor == Colors.black ? Colors.blue : Colors.black;
    });
  }

  void _changeTextSize() {
    setState(() {
      _textSize = _textSize == 24 ? 32 : 24;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello, Command Pattern!',
          style: TextStyle(color: _textColor, fontSize: _textSize),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            remote.setCommand(ChangeTextColorCommand(_changeTextColor));
            remote.pressButton();
          },
          child: Text('Change Text Color'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            remote.setCommand(ChangeTextSizeCommand(_changeTextSize));
            remote.pressButton();
          },
          child: Text('Change Text Size'),
        ),
      ],
    );
  }
}