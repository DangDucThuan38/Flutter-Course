import 'package:flutter/material.dart';

class Todo {
  String title;
  String description;
  Todo({required this.title, required this.description});
}

List<Todo> todoList = [
  Todo(title: 'To do 1', description: 'description A'),
  Todo(title: 'To do 2', description: 'description B'),
  Todo(title: 'To do 3', description: 'description C'),
];

void main() {
  runApp(MaterialApp(title: 'send data', home: TodoScreen()));
}

class TodoScreen extends StatefulWidget {
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoList[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(todo: todoList[index])));
              },
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  removeTodo(index);
                },
              ),
              onLongPress: () {
                removeTodo(index);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addTodo(context),
      ),
    );
  }

  void addTodo(BuildContext context) {
    String newTitle = "";
    String newDescription = "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add a new task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  onChanged: (value) {
                    newTitle = value;
                  },
                  decoration: InputDecoration(hintText: "Enter some title"),
                ),
                TextField(
                  onChanged: (value) {
                    newDescription = value;
                  },
                  decoration:
                  InputDecoration(hintText: "Enter some description"),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Add"),
                onPressed: () {
                  setState(() {
                    todoList.add(
                        Todo(title: newTitle, description: newDescription));
                  });
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void removeTodo(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
}



class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(child: Text(todo.description)),
    );
  }
}