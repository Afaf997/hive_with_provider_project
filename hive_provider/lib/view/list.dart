import 'package:flutter/material.dart';
import 'package:hive_provider/controller/theme.dart';
import 'package:hive_provider/controller/todoList_model.dart';
import 'package:hive_provider/controller/todo_model.dart';
import 'package:provider/provider.dart';

class ListNotes extends StatelessWidget {
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _placecontroller = TextEditingController();
  Widget _buildInputField({
    TextEditingController? controller,
    IconData? icon,
    String hintText = '',
  }) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  ListNotes({super.key});
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(
      context,
    );
    final todoListViewModel = Provider.of<TodoListModel>(
      context,
    );
    final todosbox = todoListViewModel.todosbox;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Todo app'),
        actions: [
          IconButton(
            onPressed: () {
              themeModel.darkThemeModel();
            },
            icon: const Icon(
              Icons.dark_mode_rounded,
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: todosbox.length,
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: Colors.grey); // Separator
        },
        itemBuilder: (context, index) {
          final toDo = todosbox[index];
          return Padding(
            padding: EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(6), // Border
              ),
              child: ListTile(
                title: Text(toDo.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                subtitle: Text(toDo.place),
                trailing: Text("${toDo.age}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue)),
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Delete",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          content: const Text(
                              "Are You Sure Want to delete this item"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                todoListViewModel.deleteTodo(toDo);
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                children: [
                  _buildInputField(
                    controller: _namecontroller,
                    icon: Icons.verified_user,
                    hintText: 'Enter name',
                  ),
                  _buildInputField(
                    controller: _agecontroller,
                    icon: Icons.person_2_outlined,
                    hintText: 'Enter age',
                  ),
                  _buildInputField(
                    controller: _placecontroller,
                    icon: Icons.place,
                    hintText: 'Enter place',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      todoListViewModel.addTodoList(
                        _namecontroller.text,
                        int.tryParse(_agecontroller.text) ?? 0,
                        _placecontroller.text,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
