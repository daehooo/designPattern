import 'package:abstract_factory/role_factory.dart';
import 'package:abstract_factory/skill.dart';
import 'package:flutter/material.dart';

import 'champion.dart';
import 'factory/fighter_factory.dart';
import 'factory/mage_factory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Abstract Method 예제')),
      body: LeagueOfLegendsRoleBuilder(),
    ));
  }
}

class LeagueOfLegendsRoleBuilder extends StatefulWidget {
  const LeagueOfLegendsRoleBuilder({super.key});

  @override
  State<LeagueOfLegendsRoleBuilder> createState() =>
      _LeagueOfLegendsRoleBuilderState();
}

class _LeagueOfLegendsRoleBuilderState
    extends State<LeagueOfLegendsRoleBuilder> {
  final RoleFactory mageFactory = MageFactory();
  final RoleFactory fighterFactory = FighterFactory();
  bool isMageSelected = true;
  String selectedChampion = "아리";
  String selectedSkill = "매혹";

  @override
  Widget build(BuildContext context) {
    Champion champion = isMageSelected
        ? mageFactory.createChampion(selectedChampion)
        : fighterFactory.createChampion(selectedChampion);
    Skill skill = isMageSelected
        ? mageFactory.createSkill(selectedSkill)
        : fighterFactory.createSkill(selectedSkill);

    return Scaffold(
      appBar: AppBar(
        title: const Text("League of Legends Role Builder"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "챔프 타입",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: true,
                    groupValue: isMageSelected,
                    onChanged: (value) {
                      setState(() {
                        isMageSelected = value!;
                        selectedChampion = "아리"; // 초기 챔피언을 설정합니다.
                        selectedSkill = "매혹";
                      });
                    },
                    title: const Text("마법사"),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: false,
                    groupValue: isMageSelected,
                    onChanged: (value) {
                      setState(() {
                        isMageSelected = value!;
                        selectedChampion = "다리우스";
                        selectedSkill = "녹서스 단두대"; // 초기 챔피언을 설정합니다.
                      });
                    },
                    title: const Text("전사"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              onChanged: (value) {
                setState(() {
                  print(selectedChampion);
                  selectedChampion = value!;

                  // selectedSkill = isMageSelected ? "매혹" : "녹서스단두대";
                });
              },
              decoration: const InputDecoration(
                labelText: "챔피언 고르기",
              ),
              value: selectedChampion,
              items: (isMageSelected ? ["아리", "럭스"] : ["다리우스", "가렌"])
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              onChanged: (value) {
                setState(() {
                  selectedSkill = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Select Skill",
              ),
              value: selectedSkill,
              items: (isMageSelected ? ["매혹", "스파크 광선"] : ["녹서스 단두대", "판단"])
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              "Champion Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Name: ${champion.getName()}"),
            const SizedBox(height: 8),
            Text("Description: ${champion.getDescription()}"),
            const SizedBox(height: 16),
            const Text(
              "Skill Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Name: ${skill.getName()}"),
            const SizedBox(height: 8),
            Text("Description: ${skill.getDescription()}"),
          ],
        ),
      ),
    );
  }
}
