// ignore_for_file: file_names

import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;


class AuthResult {
  final int code;
  final String token;
  final bool authenticated;
  AuthResult({required this.code, required this.token, required this.authenticated});
  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      code: json["code"],
      token: json["result"]["token"] ?? "",  // Lấy token từ result
      authenticated: json["result"]["authenticated"] ?? false, // Tránh lỗi null
    );
  }
}

class AuthenRepository{
  Future<AuthResult> authenticate(String password, String username) async {
  String apiUrl = "http://localhost:8080/auth/login";

  try {
  
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"password": password, "username": username}),
    );
    Map<String, dynamic> responseData = json.decode(response.body);
  
    return AuthResult.fromJson(responseData);
  } catch (e) {
    return AuthResult(code: 0, token: "null", authenticated: false);
  }
}

  Future<String> Register_MPA(User user) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/users';

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
      throw Exception('Exception occurred: $e');
    }
  }
  Future<void> logout() async{
  final String apiUrl = 'http://localhost:8080/auth/logout';
  try{
    final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',

        });
  }
  catch(e){
    throw Exception('Exception occurred: $e');
  }
}
}