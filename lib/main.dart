import 'package:flutter/material.dart';
import 'package:rest_api/screen/home.dart';
import 'package:rest_api/screen/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   // useMaterial3: true,
      // ),
      theme: ThemeData.dark(),
      // home: HomeScreen(),
      home: const TodoListScreen(),
    );
  }
}
