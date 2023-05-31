import 'package:factory_method_pattern_example2/unit_viewer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('스타 유닛')),
        body: const UnitViwer(),
      ),
    );
  }
}
