// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/ApiResult.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/models/contract.dart';

class ContractRepository {
  Future<ApiResult> lockOrUnLockContract(bool newState, Contract contract, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/contract/${contract.contractID}';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"status": "$newState"}),
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

  Future<ApiResult> cretateContract(Contract contract, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/contract';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: contract.toJson(),
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

  // Future<ApiResult> giveContractBySearchAndPageParent(String search, int page, String token, String typeContract, CardHolder cardholder) async {
  //   String apiUrl = "http://localhost:8080/smartwalletapp/${cardholder.cardHolderId}/contracts/$typeContract/$page/$search";

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
  //       List<Contract> contractParent = responseData["result"]["list"];
  //       int page = responseData["result"]["page"];
  //       int pageAmount = responseData["result"]["amount"];
  //       ApiResult result = ApiResult(code, message, contractParent, page,pageAmount);
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