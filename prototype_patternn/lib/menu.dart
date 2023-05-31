import 'menu_prototype.dart';

class Menu extends MenuPrototype {
  String name;
  int price;

  Menu(this.name, this.price);

  @override
  Menu clone() {
    return Menu(name, price);
  }
}
