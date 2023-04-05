import 'package:flutter/material.dart';

// UIComponent 인터페이스
abstract class UIComponent {
  Widget render();
}

// Button 클래스
class Button implements UIComponent {
  String label;
  Button(this.label);

  @override
  Widget render() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}

// Composite 클래스
class Composite implements UIComponent {
  List<UIComponent> components = [];

  void add(UIComponent component) {
    components.add(component);
  }

  void remove(UIComponent component) {
    components.remove(component);
  }

  @override
  Widget render() {
    return Column(
      children: components.map((component) => component.render()).toList(),
    );
  }
}

// 메인 함수
void main() => runApp(MyApp());

// MyApp 클래스
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final composite = Composite();

  @override
  void initState() {
    super.initState();
    composite.add(Button("Button 1"));
    composite.add(Button("Button 2"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Composite Pattern Demo")),
        body: composite.render(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              composite
                  .add(Button("Button ${composite.components.length + 1}"));
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
