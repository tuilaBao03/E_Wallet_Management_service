// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/ApiResult.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:http/http.dart' as http;

class CardholderRepository {

  Future<ApiResult> giveCardHolderBySearchAndPage(String search, int page, String token) async {
  String apiUrl = "http://localhost:8080/smartwalletapp/cardHolders/{$page}/{$search}";

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
      List<CardHolder> cardHolders = responseData["result"]["list"];
      int page = responseData["result"]["page"];
      int pageAmount = responseData["result"]["amount"];
      ApiResult result = ApiResult(code, message, cardHolders, page,pageAmount);
      return result;
    } else {
      Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception("Lỗi API: ${errorData["message"]}");
    }
  } catch (e) {
    throw Exception("Lỗi kết nối: $e");
  }
}

  Future<ApiResult> createCardHolder(CardHolder cardHolder,  String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/cardHolders';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(cardHolder.toJson()),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      String message = responseData['message'];
      int code = responseData['code'];
      if(code == 200){
        CardHolder cardHolders = responseData["result"];
        ApiResult apiResult = ApiResult(code, message,cardHolders, 0, 0);
        return(apiResult);
      }
      else{
        throw Exception("Exception occurred:__$message");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

}