import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_provider/controller/mainprovider.dart';
import 'package:hive_provider/controller/theme.dart';
import 'package:hive_provider/controller/todoList_model.dart';
import 'package:hive_provider/controller/todo_model.dart';
import 'package:hive_provider/model/todo_adapter.dart';
import 'package:hive_provider/view/home.dart'; 
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive. registerAdapter(TodoAdapter());
  Hive. registerAdapter(TodoListAdapter());
  await Hive.openBox<Todo>("todos");
  await Hive.openBox<TodoList>("todosbox");

  runApp(MultiProvider (
    providers: [
      ChangeNotifierProvider(
        create:(_)=>TodoViewModel (),),
      ChangeNotifierProvider(
        create: (_)=>ThemeModel ()),
         ChangeNotifierProvider(
        create:(_)=> MainProvider(),),
        ChangeNotifierProvider(
        create:(_)=> TodoListModel(),),
    ],
 
    child: MyApp()));
}
  

