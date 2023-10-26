import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Todo'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'Decoration...'),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitData() async {
    // Get the data from form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    // Submit data to the server
    final url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      // headers: {' Content-Type': 'application/json'},
    );
    //  Show success or fail message based on status
    print(response.statusCode);
    print(response.body);
  }
}
