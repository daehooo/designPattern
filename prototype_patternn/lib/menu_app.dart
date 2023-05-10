import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'menu_page.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype Pattern Menu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MenuPage(title: "메뉴판입니다"),
    );
  }
}
