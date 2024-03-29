import 'package:flutter/material.dart';

import 'character.dart';
import 'character_factory.dart';
import 'character_type.dart';

class CharacterCreationScreen extends StatefulWidget {
  const CharacterCreationScreen({super.key});

  @override
  State<CharacterCreationScreen> createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  CharacterType? _selectedCharacterType;
  String _characterName = "";
  int _characterLevel = 1;
  String _characterInfo = "";

  void _onCharacterNameChanged(String value) {
    setState(() {
      _characterName = value;
    });
  }

  void _onCharacterTypeSelected(CharacterType? type) {
    if (type != null) {
      setState(() {
        _selectedCharacterType = type;
      });
    }
  }

  void _onCharacterLevelChanged(int value) {
    setState(() {
      _characterLevel = value;
    });
  }

  void _onCreateCharacterButtonPressed() {
    if (_selectedCharacterType != null && _characterName.isNotEmpty) {
      Character character = CharacterFactory.createCharacter(
        _selectedCharacterType!,
        name: _characterName,
        level: _characterLevel,
      );

      setState(() {
        _characterInfo =
            "캐릭터 정보 - 직업: ${character.job}, 이름: ${character.name}, 레벨: ${character.level}";
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("오류"),
            content: const Text("캐릭터 타입과 이름을 입력해주세요."),
            actions: [
              TextButton(
                child: const Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("캐릭터 생성"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<CharacterType>(
              value: _selectedCharacterType,
              onChanged: (type) => _onCharacterTypeSelected(type), // 수정된 부분
              items: CharacterType.values
                  .map((type) => DropdownMenuItem<CharacterType>(
                        value: type,
                        child: Text(_getCharacterTypeName(type)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) => _onCharacterNameChanged(value),
              decoration: const InputDecoration(
                labelText: "캐릭터 이름",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Slider(
              value: _characterLevel.toDouble(),
              min: 1,
              max: 100,
              onChanged: (value) => _onCharacterLevelChanged(value.toInt()),
              label: "레벨: $_characterLevel",
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onCreateCharacterButtonPressed,
              child: const Text("캐릭터 생성"),
            ),
            const SizedBox(height: 16.0),
            Text(
              _characterInfo,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  String _getCharacterTypeName(CharacterType type) {
    switch (type) {
      case CharacterType.Warrier:
        return "전사";
      case CharacterType.Archer:
        return "궁수";
      case CharacterType.Mage:
        return "마법사";
      default:
        throw ArgumentError("잘못된 캐릭터 타입입니다.");
    }
  }
}
