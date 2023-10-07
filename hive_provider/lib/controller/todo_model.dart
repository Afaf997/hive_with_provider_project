import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_provider/model/todo_adapter.dart';

class TodoViewModel extends ChangeNotifier {
  final Box<Todo> _todoBox = Hive.box<Todo>('todos');

  List<Todo> get todos => _todoBox.values.toList();

  void addTodo(String title) {
    final newTodo = Todo(title: title);
    _todoBox.add(newTodo);
    notifyListeners();
  }

  void TodoChecked(Todo todo) {
    todo.ischecked = !todo.ischecked;
    todo.save();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todo.delete();
    notifyListeners();
  }
}
