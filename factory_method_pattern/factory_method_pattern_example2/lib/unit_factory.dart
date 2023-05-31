import 'package:factory_method_pattern_example2/unit.dart';
import 'package:factory_method_pattern_example2/zealot.dart';
import 'package:factory_method_pattern_example2/zergling.dart';

import 'marine.dart';

abstract class UnitFactory {
  Unit createUnit();
}

class MarineFactory implements UnitFactory {
  @override
  Unit createUnit() {
    return Marine();
  }
}

class ZerglingFactory implements UnitFactory {
  @override
  Unit createUnit() {
    return Zergling();
  }
}

class ZealotFactory implements UnitFactory {
  @override
  Unit createUnit() {
    return Zealot();
  }
}
