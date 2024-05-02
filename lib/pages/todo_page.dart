import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_flutter_app/data/database.dart';
import 'package:new_flutter_app/util/custom_appbar.dart';
import 'package:new_flutter_app/util/sidebar.dart';
import 'package:new_flutter_app/util/task_dialog.dart';
import 'package:new_flutter_app/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOITEMS') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoItems[index][1] = !db.toDoItems[index][1];
    });
    db.updateData();
  }

  void openAddFormDialog() {
    showDialog(
      context: context,
      builder: (context) => TaskDialog(
        controller: _controller,
        onSave: saveNewTask,
        onCancle: () {
          Navigator.of(context).pop();
          _controller.clear();
        },
      ),
    );
  }

  void saveNewTask() {
    debugPrint('Saved');
    setState(() {
      db.toDoItems.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask(index) {
    debugPrint('Deleted');
    setState(() {
      db.toDoItems.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: const CustomAppBar(
        title: 'Todo List',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ListView.builder(
          itemCount: db.toDoItems.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              task: db.toDoItems[index][0],
              taskCompleted: db.toDoItems[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteTask: (context) => deleteTask(index),
            );
          },
        ),
      ),
      drawer: const Sidebar(),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddFormDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
