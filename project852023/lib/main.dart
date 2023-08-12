import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyHome()));

//stf

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class ToDo {
  bool isDone;
  String name;
  ToDo({required this.name, this.isDone = false});
}

List<ToDo> _item = [
  ToDo(name: "Task 1"),
  ToDo(name: "Task 2"),
  ToDo(name: "Task 3")
];

class _MyHomeState extends State<MyHome> {
  List<String> _todos = ['Task 1', 'Task 2', 'Task 3'];
  void _addList() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTodo = '';
          return AlertDialog(
            title: Text('Add new task '),
            content: TextField(
              decoration: InputDecoration(hintText: 'Enter new text'),
              autofocus: true,
              onChanged: (value) {
                newTodo = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancle')),
              TextButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    _todos.add(newTodo);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            final todo = _todos[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (_item[index].isDone == true)
                    _item[index].isDone = false;
                  else
                    _item[index].isDone = true;
                  //_item[index].isDone=!_item[index].isDone;
                });
              },
              child: ListTile(
                title: Text(
                  todo,
                  style: TextStyle(
                      decoration: _item[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addList,
      ),
    );
  }
}
