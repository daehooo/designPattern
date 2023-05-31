import 'package:flutter/material.dart';

import 'champion_skin_caretaker.dart';
import 'champion_skin_originator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '롤 챔프 선택',
            style: TextStyle(
              fontFamily: 'Friz Quadrata',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.purple.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: SkinSelector(),
      ),
    );
  }
}

class SkinSelector extends StatefulWidget {
  @override
  _SkinSelectorState createState() => _SkinSelectorState();
}

class _SkinSelectorState extends State<SkinSelector> {
  final originator = ChampionSkinOriginator('asset/5.jpeg');
  late ChampionSkinCaretaker caretaker;
  final skins = [
    'asset/5.jpeg',
    'asset/6.jpeg',
    'asset/7.jpeg',
    'asset/8.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    caretaker = ChampionSkinCaretaker(originator);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Hero(
              tag: 'champion_skin',
              child: Image.asset(
                originator.skinUrl,
                height: 250,
                width: 250,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: skins.map((skinUrl) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      originator.skinUrl = skinUrl;
                      caretaker.save();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        skinUrl,
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    caretaker.undo();
                  });
                },
                child: const Text('이전'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontFamily: 'Friz Quadrata',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    caretaker.redo();
                  });
                },
                child: Text('다음'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontFamily: 'Friz Quadrata',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
