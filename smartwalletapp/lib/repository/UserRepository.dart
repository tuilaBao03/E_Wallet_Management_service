// ignore_for_file: non_constant_identifier_names, file_names, avoid_print, depend_on_referenced_packages, unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  Future<List<User>> loadUsersFromJson() async {
    String jsonString = await rootBundle.loadString('assets/mockup/UserMockup.json');
    List<dynamic> jsonList = json.decode(jsonString);
    print("----------------------------------");
    int a = jsonList.map((data) => User.fromJson(data)).toList().length;
    print("so luwonng user : $a");
    return jsonList.map((data) => User.fromJson(data)).toList();
  }
  Future<User?> findUserByUserName(String username) async{
    
    List<User> users = await loadUsersFromJson();
    User user = users.firstWhere(
        (user) =>user.username == username,
    );
    return user;
  }
  Future<String> checkingEmail(String email) async {
  List<User> users = await loadUsersFromJson();
  
  try {
    User user = users.firstWhere(
      (user) => user.email == email,
    );
    return GiveInfortoEmail(email); // Nếu tìm thấy user, gọi hàm xử lý
  } catch (e) {
    return "0"; // Nếu không tìm thấy user, trả về "0"
  }
}
  Future<String> GiveInfortoEmail(String email) async{
    print("completed");
    return "completed";
  }
  Future<bool> Authenticate(String username, String password) async {
    print("ssss$username");
    List<User> users = await loadUsersFromJson();
    print(users.length);
    return users.any((user) => user.username == username && user.password == password);
  }
  Future<bool> UserExisted(String username) async{
    List<User> users = await loadUsersFromJson();
    return users.any((user) => user.username == username);
  }
  // Chuyển danh sách Users thành JSON và lưu vào file
  // Future<void> saveUsersToJson(List<User> users) async {
  //   try {
  //     File file = await _getLocalFile();
  //     String jsonString = jsonEncode(users.map((user) => user.toJson()).toList());
  //     await file.writeAsString(jsonString);
  //     print("✅ Users saved to $file");
  //   } catch (e) {
  //     print("❌ Error saving users: $e");
  //   }
  // }
  Future<String> Register_MPA(User user) async{
    final String apiUrl = 'http://10.0.2.2:8080/myparkingapp/users';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return "200";

      } else {
        Map<String, dynamic> responseData = json.decode(response.body);
        String code = responseData["code"];
        return code;

      }
    } catch (e) {
      print('Exception occurred: $e');
      return "Error";
    }
  }

}

