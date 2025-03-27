// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/response/cardHolder/cardholderResponse.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';

class CardHolderRepository {

  Future<ApiResult> giveCardHolderBySearchAndPage(String search, int page, String token) async {

  print("+++++++++++++++++1++++++++++++++++++");
  String apiUrl = "http://localhost:8080/smartwalletapp/cardholder/$search/$page";
  print("apiUrl: $apiUrl");

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    int code = responseData["code"] ?? 404;
    String message = responseData["message"];
    if (response.statusCode == 200) {
      List<GetCardHolderResponse> cardHolders = (responseData["result"]["cardholders"] as List)
      .map((e) => GetCardHolderResponse.fromJson(e))
      .toList();
      int page = responseData["result"]["page"] ?? 10;
      int pageAmount = responseData["result"]["pageAmount"] ?? 10;
      ApiResult result = ApiResult(code, message, cardHolders, page, pageAmount);
      return result;
    } else {
      Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception("Lỗi API: ${errorData["message"]}");
    }
  } catch (e) {
    throw Exception("Lỗi kết nối_________: $e");
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
      String message = responseData['message'];
      int code = response.statusCode;
    
      if(code == 200 ){
        CardHolderResponse cardHolders = CardHolderResponse.fromJson(responseData["result"]);
        ApiResult apiResult = ApiResult(code, cardHolders.retMsg,cardHolders, 0, 0);
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