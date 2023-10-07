import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_provider/model/todo_adapter.dart';

class TodoListModel extends ChangeNotifier{


  final Box<TodoList> _todolistmodel =Hive.box("todosbox");

    List<TodoList> get todosbox => _todolistmodel.values.toList();
    

    void addTodoList(String name,int age,String place) {
    final newTodoList = TodoList(name: name, age: age, place:place,);
    _todolistmodel.add(newTodoList);
    notifyListeners();
  }

   void deleteTodo(TodoList tododelete) {
    tododelete.delete();
    notifyListeners();
  }



}