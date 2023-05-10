import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'menu.dart';

// class MenuPage extends StatefulWidget {
//   MenuPage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MenuPageState createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> {
//   final List<Menu> menus = [
//     Menu('피자', 15000),
//     Menu('햄버거', 8000),
//     Menu('파스타', 12000),
//   ];

//   final List<Menu> orderedMenus = [];

//   String newMenuName = '';
//   int newMenuPrice = 0;

//   @override
//   Widget build(BuildContext context) {
//     double totalPrice =
//         orderedMenus.fold(0, (prev, element) => prev + element.price);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: Text('새 메뉴 추가'),
//                     content: Column(
//                       children: [
//                         TextField(
//                           onChanged: (value) {
//                             newMenuName = value;
//                           },
//                           decoration: InputDecoration(
//                             labelText: "메뉴 이름",
//                           ),
//                         ),
//                         TextField(
//                           onChanged: (value) {
//                             newMenuPrice = int.parse(value);
//                           },
//                           decoration: InputDecoration(
//                             labelText: "메뉴 가격",
//                           ),
//                           keyboardType: TextInputType.number,
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       TextButton(
//                         child: Text('추가'),
//                         onPressed: () {
//                           setState(() {
//                             menus.add(Menu(newMenuName, newMenuPrice));
//                             newMenuName = '';
//                             newMenuPrice = 0;
//                             Navigator.of(context).pop();
//                           });
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: menus.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text('${menus[index].name}',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     subtitle: Text('${menus[index].price}원'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.shopping_cart),
//                       onPressed: () {
//                         setState(() {
//                           orderedMenus.add(menus[index].clone());
//                         });
//                       },
//                     ),
//                     leading: IconButton(
//                       icon: Icon(Icons.delete_outline),
//                       onPressed: () {
//                         setState(() {
//                           menus.removeAt(index);
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Text('주문 목록',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           Expanded(
//             child: ListView.builder(
//               itemCount: orderedMenus.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text('${orderedMenus[index].name}',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     subtitle: Text('${orderedMenus[index].price}원'),
//                     leading: IconButton(
//                       icon: Icon(Icons.cancel),
//                       onPressed: () {
//                         setState(() {
//                           orderedMenus.removeAt(index);
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text('주문한 메뉴 수: ${orderedMenus.length}개',
//                 style: TextStyle(fontSize: 16)),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child:
//                 Text('주문 합계: ${totalPrice}원', style: TextStyle(fontSize: 16)),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MenuPage extends StatefulWidget {
  MenuPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Menu> menus = [
    Menu('피자', 15000),
    Menu('햄버거', 8000),
    Menu('파스타', 12000),
  ];

  final List<Menu> orderedMenus = [];

  String newMenuName = '';
  int newMenuPrice = 0;

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        orderedMenus.fold(0, (prev, element) => prev + element.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('새 메뉴 추가'),
                    content: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            newMenuName = value;
                          },
                          decoration: InputDecoration(
                            labelText: "메뉴 이름",
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            newMenuPrice = int.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: "메뉴 가격",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('추가'),
                        onPressed: () {
                          setState(() {
                            menus.add(Menu(newMenuName, newMenuPrice));
                            newMenuName = '';
                            newMenuPrice = 0;
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text('${menus[index].name}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text('${menus[index].price}원',
                        style: TextStyle(fontSize: 16, color: Colors.orange)),
                    trailing: TextButton(
                      child: Text('주문', style: TextStyle(color: Colors.orange)),
                      onPressed: () {
                        setState(() {
                          orderedMenus.add(menus[index].clone());
                        });
                      },
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.delete_outline),
                      color: Colors.orange,
                      onPressed: () {
                        setState(() {
                          menus.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text('주문 목록',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: orderedMenus.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text('${orderedMenus[index].name}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text('${orderedMenus[index].price}원',
                        style: TextStyle(fontSize: 16, color: Colors.orange)),
                    leading: IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.orange,
                      onPressed: () {
                        setState(() {
                          orderedMenus.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('주문한 메뉴 수: ${orderedMenus.length}개',
                style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Text('주문 합계: ${totalPrice}원', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
