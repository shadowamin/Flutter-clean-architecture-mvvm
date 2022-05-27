import 'dart:convert';

import 'package:flutter_clean_architecture/domain/Repository.dart';
import 'package:flutter_clean_architecture/domain/User.dart';
import 'package:http/http.dart' as http;

class RepositoryImpl extends Repository {
  @override
  Future<List<User>> loadUsers() async {
    final response = await http.get(Uri.parse("https://reqres.in/api/users"));
    if (response.statusCode == 200) {
      return parseUsers(response.body);
    } else {
      throw Exception("failed to load Users");
    }
  }

  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody);
    final data = parsed["data"] as List;
    return data.map<User>((json) => User.fromJson(json)).toList();
  }
}
