import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/user.dart';

class UserAPI {
  static Future<List<void>> fetchUsers() async {
    print('fetchUsers called!');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    // setState(() {
    //   users = transform;
    // });
    print('fetchUsers completed!');
    return users;
  }
}
