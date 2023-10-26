import 'package:flutter/material.dart';
import 'package:rest_api/screen/todo_app.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Todo List '),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: const Text('Add Todo'),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => const AddTodoScreen(),
    );
    Navigator.push(context, route);
  }
}
