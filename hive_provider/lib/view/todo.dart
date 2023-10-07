import 'package:flutter/material.dart';
import 'package:hive_provider/controller/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:hive_provider/controller/theme.dart';


class TodoListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();


  TodoListScreen({super.key});
  @override
    @override
  Widget build(BuildContext context) {
    // print('build');
    final themeModel = Provider.of<ThemeModel>(context,);
    final todoViewModel = Provider.of<TodoViewModel>(context,);
    final todos = todoViewModel.todos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              themeModel.darkThemeModel();
            },
            icon: const Icon(Icons.dark_mode_rounded,
           ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter  description',
                contentPadding: EdgeInsets.all(16.0),
              ),
               onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  todoViewModel.addTodo(value);
                  _controller.clear(); 
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                    title: Text(todo.title),
                    trailing: Checkbox(
                      value: todo.ischecked,
                      onChanged: (_) =>
                          todoViewModel.TodoChecked(todo),
                    ),
                    onLongPress: () {
                      todoViewModel.deleteTodo(todo);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Todo Deleted')));
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}