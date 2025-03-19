// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/models/create_card_request.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/models/create_contractV2_request.dart';

class CardRepository {

  Future<ApiResult> lockOrUnLockCard(bool newState, CreateCardRequest card, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/cards/';
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
        CreateContractRequest contract = responseData["result"];
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

  Future<ApiResult> giveCardByContractV2( String token, CreateContractV2Request contractv2) async {
    String apiUrl = "http://localhost:8080/smartwalletapp/contracts/contractV2s/cards";
    // try {
    //   final response = await http.post(
    //     Uri.parse(apiUrl),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Authorization': 'Bearer $token',
    //     },
    //   );
    //   Map<String, dynamic> responseData = json.decode(response.body);
    //   int code = responseData["code"];
    //   String message = responseData["message"];
    //   if (response.statusCode == 200) {
    //     Cards card = responseData["result"];
    //     ApiResult result = ApiResult(code, message, card, 0,0);
    //     return result;
    //   } else {
    //     Map<String, dynamic> errorData = json.decode(response.body);
    //     throw Exception("Lỗi API: ${errorData["message"]}");
    //   }
    // } catch (e) {
    //   throw Exception("Lỗi kết nối: $e");
    // }

    List<CreateCardRequest> cards = cardsList.where((i)=>i.contractIdentifier == contractv2.liabContractIdentifier ).toList();
    ApiResult apiResult = ApiResult(0, '',cards, 0, 0);
    return apiResult;
  }
  

}