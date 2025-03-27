// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/apiResult.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/response/contract/create_contract_reponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';


class AllContractsList{
      List<GetContractResponse> libContracts;
      List<GetContractResponse> issueContracts;
      List<GetContractResponse> cardContracts;

    AllContractsList(
      this.libContracts,this.issueContracts,this.cardContracts
    );
  }
class ContractRepository {


  Future<ApiResult> createdLibContract(CreateContractRequest contract, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/Libcontract';
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
  Future<ApiResult> createdIssueContract(CreateContractRequest contract, String token) async{
      final String apiUrl = 'http://localhost:8080/smartwalletapp/Issuecontract';
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
  Future<ApiResult> createdCardContract(CreateContractRequest contract, String token) async{
    final String apiUrl = 'http://localhost:8080/smartwalletapp/Cardcontract';
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
  Future<ApiResult> giveContractByCLient(String identityClient ,String token) async {
    String apiUrl = "http://localhost:8080/smartwalletapp/contract/ByClient/$identityClient";

    try {
      print(apiUrl);
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      int code = responseData["code"] ?? 0;
      String message = responseData["message"];
      if (response.statusCode == 200 ) {
        List<GetContractResponse> libContracts = (responseData["result"] as List)
      .map((e) => GetContractResponse.fromJson(e))
      .toList();
        
        ApiResult result = ApiResult(code, message, libContracts,1,1);
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

    Future<ApiResult> giveAllContract(String token, int page,String search) async {
    String apiUrl = "http://localhost:8080/smartwalletapp/contract/$search/$page";
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
        List<GetContractResponse> libContracts = responseData["result"]["libContract"];
        int page = responseData["result"]["page"];
        int pageAmount = responseData["result"]["pageAmount"];
        
        ApiResult result = ApiResult(code, message, libContracts , page,pageAmount);
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