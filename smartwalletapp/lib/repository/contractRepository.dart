// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/apiResult.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/contractV2.dart';
import 'package:smartwalletapp/response/contract/contractResponse.dart';

class ContractRepository {
  // Future<ApiResult> lockOrUnLockContract(bool newState, Contract contract, String token) async{
  //   final String apiUrl = 'http://localhost:8080/smartwalletapp/contract/${contract.contractID}';
  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode({"status": "$newState"}),
  //     );
  //     Map<String, dynamic> responseData = json.decode(response.body);
  //     String message = responseData['message'];
  //     int code = responseData['code'];
  //     if(code == 200){
  //       Contract contract = responseData["result"];
  //       ApiResult apiResult = ApiResult(code, message,contract, 0, 0);
  //       return(apiResult);
  //     }
  //     else{
  //       throw Exception("Exception occurred:__$message");
  //     }
  //   } catch (e) {
  //     throw Exception('Exception occurred: $e');
  //   }
  // }

  Future<ApiResult> cretateContract(Contract contract, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/contract';
    try {
      print(contract.toString());
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(contract.toJson()),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      print("_________________response_________$responseData");
      String message = responseData['message'];
      int code = response.statusCode;
      if(code == 200){
        CreateContractResponse contract = CreateContractResponse.fromJson(responseData["result"]);
        print("_______contract_________${contract.toString()}");
        int newCode = contract.retCode;
        print("________new code________________$newCode");
        String newMess  = contract.retMsg; 
        print("________new mess__________$newMess");
        ApiResult apiResult = ApiResult(newCode, newMess,contract, 0, 0);
        return(apiResult);
      }
      else{
        throw Exception("Exception occurred:__$message");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }
  Future<ApiResult> giveContract(String search, int page, String token, CardHolder cardHolder) async {
    String apiUrl = "http://localhost:8080/smartwalletapp/contract/contractV2";

    try {
      // final response = await http.get(
      //   Uri.parse(apiUrl),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Authorization': 'Bearer $token',
      //   },
      // );
      // Map<String, dynamic> responseData = json.decode(response.body);
      // int code = responseData["code"];
      // String message = responseData["message"];
      int code = 200;
      String message = '';
      if (code == 200) {
        // List<Contract> contractParent = responseData["result"]["list"];
        // int page = responseData["result"]["page"];
        // int pageAmount = responseData["result"]["amount"];
        List<Contract> contracts = contractList.where((i)=>i.clientIdentifier == cardHolder.clientNumber ).toList();
        ApiResult result = ApiResult(0, '', contracts, 1,1);
        return result;
      } else {
        // Map<String, dynamic> errorData = json.decode(response.body);
        // throw Exception("Lỗi API: ${errorData["message"]}");
        throw Exception("Exception occurred:__$message");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }

  Future<ApiResult> giveContractV2(String search, int page, String token, Contract contract,) async {
    String apiUrl = "http://localhost:8080/smartwalletapp/contract/contractV2";

    try {
      // final response = await http.get(
      //   Uri.parse(apiUrl),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Authorization': 'Bearer $token',
      //   },
      // );
      // Map<String, dynamic> responseData = json.decode(response.body);
      // int code = responseData["code"];
      // String message = responseData["message"];
      int code = 200;
      String message = '';
      if (code == 200) {
        // List<Contract> contractParent = responseData["result"]["list"];
        // int page = responseData["result"]["page"];
        // int pageAmount = responseData["result"]["amount"];
        List<ContractV2> contractV2s = contractV2List.where((i)=>i.cbsNumber == contract.cbsNumber).toList();

        ApiResult result = ApiResult(0, '', contractV2s, 1,1);
        return result;
      } else {
        // Map<String, dynamic> errorData = json.decode(response.body);
        // throw Exception("Lỗi API: ${errorData["message"]}");
        throw Exception("Exception occurred:__$message");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
  

}