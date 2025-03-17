// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/ApiResult.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:http/http.dart' as http;

class CardRepository {

  Future<ApiResult> lockOrUnLockCard(bool newState, CardInfo card, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/cards/${card.CardID}';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',

        },
        body: jsonEncode({"status": "newState"}),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      String message = responseData['message'];
      int code = responseData['code'];
      if(code == 200){
        Contract contract = responseData["result"];
        ApiResult apiResult = ApiResult(code, message,contract, 0, 0);
        return(apiResult);
      }
      else{
        throw Exception("Exception occurred:__$message");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  // Future<ApiResult> giveCardByContract( String token, Contract contract) async {
  //   String apiUrl = "http://localhost:8080/smartwalletapp//${contract.contractID}/card";
  //   try {
  //     final response = await http.get(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     Map<String, dynamic> responseData = json.decode(response.body);
  //     int code = responseData["code"];
  //     String message = responseData["message"];
  //     if (response.statusCode == 200) {
  //       CardInfo cardInfo = responseData["result"];
  //       ApiResult result = ApiResult(code, message, cardInfo, 0,0);
  //       return result;
  //     } else {
  //       Map<String, dynamic> errorData = json.decode(response.body);
  //       throw Exception("Lỗi API: ${errorData["message"]}");
  //     }
  //   } catch (e) {
  //     throw Exception("Lỗi kết nối: $e");
  //   }
  // }
  

}