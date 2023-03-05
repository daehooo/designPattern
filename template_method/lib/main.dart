import 'package:flutter/material.dart';

// Abstract class for creating todo items
abstract class TodoCreator {
  Widget buildInputField(
      BuildContext context, TextEditingController controller);
  String getAppBarTitle();
  void onSubmit(String text);
}

// Concrete class for creating todo items
class SimpleTodoCreator extends TodoCreator {
  @override
  Widget buildInputField(
      BuildContext context, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: 'Enter todo item'),
    );
  }

  @override
  String getAppBarTitle() {
    return 'Add Todo';
  }

  @override
  void onSubmit(String text) {
    print('Added todo: $text');
  }
}

// Abstract class for displaying todo items
abstract class TodoDisplay {
  Widget buildList(List<String> todos);
  String getAppBarTitle();
}

// Concrete class for displaying todo items
class SimpleTodoDisplay extends TodoDisplay {
  @override
  Widget buildList(List<String> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(todos[index]),
      ),
    );
  }

  @override
  String getAppBarTitle() {
    return 'Todo List';
  }
}

// Base widget that uses the template method pattern
class TodoScreen extends StatefulWidget {
  final TodoCreator creator;
  final TodoDisplay display;

  TodoScreen({required this.creator, required this.display});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _controller = TextEditingController();
  final _todos = <String>[];

  void _submit() {
    final text = _controller.text;
    _controller.clear();
    widget.creator.onSubmit(text);
    setState(() {
      _todos.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.display.getAppBarTitle()),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: widget.creator.buildInputField(context, _controller),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Add'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: widget.display.buildList(_todos),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Todo App',
    home: TodoScreen(
      creator: SimpleTodoCreator(),
      display: SimpleTodoDisplay(),
    ),
  ));
}
