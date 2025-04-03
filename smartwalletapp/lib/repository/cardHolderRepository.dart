// ignore_for_file: file_names

import 'dart:convert';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/request/edit_cardholder_request.dart';
import 'package:smartwalletapp/response/cardHolder/cardholderResponse.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';

class CardHolderRepository {

  Future<ApiResult> giveCardHolderBySearchAndPage(String search, int page, String token, int size) async {
    // ✅ Thêm `size` vào query parameters
    String apiUrl = "http://localhost:8080/smartwalletapp/cardholder?search=$search&page=$page&size=$size";
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
      String message = responseData["message"] ?? "Unknown error";

      if (response.statusCode == 200) {
        List<GetCardHolderResponse> cardHolders = (responseData["result"]["cardholders"] as List)
            .map((e) => GetCardHolderResponse.fromJson(e))
            .toList();
        int page = responseData["result"]["page"];
        int pageAmount = responseData["result"]["pageTotal"];
        return ApiResult(code, message, cardHolders, page, pageAmount);
      } else {
        throw Exception("Lỗi API: ${responseData["message"]}");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }


  Future<CardHolderResponse> createCardHolder(CreateClientV4Body cardHolder,  String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/cardholder';

    try {

      print("\n__________________request________________________\n");
      print(cardHolder.toJson());
      print("\n__________________request________________________\n");
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(cardHolder.toJson()),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
  
      if(response.statusCode == 200 ){
        CardHolderResponse cardHolders = CardHolderResponse.fromJson(responseData);
        return(cardHolders);
      }
      else{
        throw Exception("Exception occurred:__createCardHolder");
      }
    } catch (e) {
      throw Exception('Exception occurred $e');
    }
  }


 Future<ApiResult> editCardHolder(EditClientV6 cardHolder,  String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/cardholder/edit';

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
    
      if(response.statusCode == 200 ){
        CardHolderResponse cardHolders = CardHolderResponse.fromJson(responseData);
        ApiResult apiResult = ApiResult(cardHolders.retCode, cardHolders.retMsg,cardHolders, 0, 0);
        return(apiResult);
      }
      else{
        throw Exception("Exception occurred:");
      }
    } catch (e) {
      throw Exception('Exception occurred: createCardHolder $e');
    }
  }

}