// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/user.dart';

class UserRepository{
  Future<List<User>> loadUsersFromJson() async {
    String jsonString = await rootBundle.loadString('assets/mockup/UserMockup.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((data) => User.fromJson(data)).toList();
  }
  Future<User?> findUserByUserName(String username) async{
    List<User> users = await loadUsersFromJson();
    User user = users.firstWhere(
        (user) =>user.username == username,
    );
    return user;
  }
  Future<bool> Authenticate(String username, String password) async{
    List<User> users = await loadUsersFromJson();
    return users.any(
        (user) => user.username == username && user.password == password,
    );
}
}