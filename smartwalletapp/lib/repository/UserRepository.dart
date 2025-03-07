// ignore_for_file: non_constant_identifier_names, file_names, avoid_print, depend_on_referenced_packages, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:smartwalletapp/ApiResult.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository{


Future<ApiResult> giveUserByName(String userName, String token) async {
  String apiUrl = "http://localhost:8080/smartwalletapp/users/$userName/name";

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    int code = responseData["code"];
    String message = responseData["message"];
    if (response.statusCode == 200) {
      User user = User.fromJson(responseData["result"]);
      ApiResult result = ApiResult(code, message, user,0,0);
      return result;
    } else {
      Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception("Lỗi API: ${errorData["message"]}");
    }
  } catch (e) {
    print("giveUserByName: $e");
    throw Exception("giveUserByName: $e");
  }
}



Future<User> updatedUser(User user, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/users/${user.userId}';
    print("apiUrl $apiUrl");
    try {
      print("user $user");
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(user.toJson()),
      );
      
      print(response.body);
      Map<String, dynamic> responseData = json.decode(response.body);

      if(response.statusCode == 200){
        print(responseData["result"]);
        User user = User.fromJson(responseData["result"]);
        return user;
      }
      else {
        throw Exception("Update User faule");
      }
    }
    catch(e){
      print("updatedUser_repo: $e");
      throw Exception("updatedUser_repo:  $e");
    }
  }




}

