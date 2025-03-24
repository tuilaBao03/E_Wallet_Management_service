// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/response/cardHolder/cardholderResponse.dart';

class CardHolderRepository {

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
      List<CreateCardHolderRequest> cardHolders = responseData["result"]["list"];
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

  Future<ApiResult> createCardHolder(CreateCardHolderRequest cardHolder,  String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/cardholder';

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
      print(" RESPONSEDATA: $responseData");
      print(" __________________________________________________");
      String message = responseData['message'];
      print(message);
      print(" __________________________________________________");
      int code = response.statusCode;
      print(code);
      print(" __________________________________________________");
      if(code == 200 ){
        CardHolderResponse cardHolders = CardHolderResponse.fromJson(responseData["result"]);
        print(cardHolders);
        print(" __________________________________________________${cardHolders.retMsg}");
        ApiResult apiResult = ApiResult(code, cardHolders.retMsg,cardHolders, 0, 0);
        print("________________${apiResult.message}");
        print(" __________________________________________________");
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