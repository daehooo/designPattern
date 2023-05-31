import 'package:factory_method_pattern_example2/unit.dart';
import 'package:factory_method_pattern_example2/unit_factory.dart';
import 'package:factory_method_pattern_example2/zergling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UnitViwer extends StatefulWidget {
  const UnitViwer({super.key});

  @override
  State<UnitViwer> createState() => _UnitViwerState();
}

class _UnitViwerState extends State<UnitViwer> {
  final List<UnitFactory> _factories = [
    MarineFactory(),
    ZerglingFactory(),
    ZealotFactory(),
  ];
  late Unit _selectedUnit;

  @override
  void initState() {
    super.initState();
    _selectedUnit = _factories[0].createUnit();
  }

  void _onUnitSelected(int index) {
    setState(() {
      _selectedUnit = _factories[index].createUnit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _factories.length,
            itemBuilder: (context, index) {
              final unit = _factories[index].createUnit();
              return TextButton(
                onPressed: () => _onUnitSelected(index),
                child: Text(unit.getName()),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _selectedUnit.createImage(),
        SizedBox(
          height: 20,
        ),
        Text(_selectedUnit.getName()),
        Text(_selectedUnit.geteRace()),
        Text(_selectedUnit.getDescription()),
      ],
    );
  }
}
