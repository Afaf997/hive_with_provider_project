import 'package:hive/hive.dart';
part 'todo_adapter.g.dart';

@HiveType(typeId:1)
class Todo extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
 bool ischecked;


  Todo({required this.title,this.ischecked = false,});
}

@HiveType(typeId:2)
class TodoList extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
 int age;
 @HiveField(2)
 String place;

 TodoList({required this.name ,required this.age,required this.place});
}

