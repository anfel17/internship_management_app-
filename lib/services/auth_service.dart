import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internship_management_system/models/User.dart';

class AuthService with ChangeNotifier {
  String _baseUrl = 'http://192.168.1.7:8000/api';
  late User _currentUser;
  late String _token;

  User get currentUser => _currentUser;

  String get token => _token;

  Future<User> login(String email, String password) async {
    final response = await http.post(Uri.parse('$_baseUrl/login'), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final user = User.fromJson(data['user']);
      print (user);
      final token = data['authorization']['token']; // extract the authorization token
      print(user);
      _currentUser = user;
      _token = token; // save the authorization token in the state
      notifyListeners();
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }
}
