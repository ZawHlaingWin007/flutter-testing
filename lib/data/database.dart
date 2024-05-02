import "package:hive_flutter/hive_flutter.dart";

class TodoDatabase {
  List toDoItems = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoItems = [
      ["Go To Shopping", false],
      ["Watch Flutter Tutorial", false],
      ["Do Exercises", true],
    ];
  }

  void loadData() {
    toDoItems = _myBox.get('TODOITEMS');
  }

  void updateData() {
    _myBox.put('TODOITEMS', toDoItems);
  }
}
