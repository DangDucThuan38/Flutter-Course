import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home:MyHome()));
//stf
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  List<String> _todos = ['task 1', 'task 2','task 3'];
  void _addTodo(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Create a text editing controller to manage the input field
        //TextEditingController controller = TextEditingController();
        String newTodo ='';
        return AlertDialog(
          // Set the title of the dialog box
          title: Text('Add a new task'),
          // Add a text field to the dialog box for the user to enter text
          content: TextField(
            //controller: controller,
            decoration: InputDecoration(hintText: 'Enter some text'),
            autofocus: true,
            onChanged: (value){
              newTodo = value;
            },
          ),
          // Add two buttons to the dialog box
          actions: <Widget>[
            // Add a "Cancel" button that dismisses the dialog box without saving any input
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // Add a "Save" button that saves the input and closes the dialog box
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Update the value of _inputText with the text entered by the user
                setState(() {
                  _todos.add(newTodo);
                  //_inputText = controller.text;
                });
                // Close the dialog box
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-do')),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder:(context,index) {
            final todo = _todos[index];
            return ListTile(
              title: Text(todo),
              onTap: (){
                setState(() {
                  _todos.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}