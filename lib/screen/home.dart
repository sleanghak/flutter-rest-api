import 'package:flutter/material.dart';
import 'package:rest_api/model/user.dart';
import 'package:rest_api/service/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          final color = user.gender == 'male' ? Colors.blue : Colors.red;
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              // child: Text('${index + 1}'),
              child: Image.network(user.picture.large),
            ),
            title: Text(user.fullName),
            subtitle: Text(user.location.timezone.offset),
            tileColor: color,
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   focusColor: Colors.pink,
      //   backgroundColor: Colors.pink,
      //   hoverColor: Colors.purple,
      //   child: const Icon(Icons.refresh),
      //   onPressed: fetchUsers,
      // ),
    );
  }

  Future<void> fetchUsers() async {
    dynamic response = await UserAPI.fetchUsers();
    setState(() {
      users = response;
    });
  }

  // Future<void> fetchUsers() async {
  //   print('fetchUsers called!');
  //   const url = 'https://randomuser.me/api/?results=10';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;

  //   final transform = results.map((e) {
  //     final name = UserName(
  //       title: e['name']['title'],
  //       first: e['name']['first'],
  //       last: e['name']['last'],
  //     );

  //     return User(
  //       gender: e['gender'],
  //       email: e['email'],
  //       phone: e['phone'],
  //       cell: e['cell'],
  //       nat: e['nat'],
  //       name: name,
  //     );
  //   }).toList();

  //   setState(() {
  //     users = transform;
  //   });
  //   print('fetchUsers completed!');
  // }
}
