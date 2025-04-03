// ignore_for_file: file_names

import 'dart:convert';

import 'package:smartwalletapp/apiResult.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/request/activate_contract.dart';
import 'package:smartwalletapp/request/create_contract_card_request.dart';
import 'package:smartwalletapp/request/create_contract_issue_request.dart';
import 'package:smartwalletapp/request/create_contract_liab_request.dart';
import 'package:smartwalletapp/request/edit_contract_request.dart';
import 'package:smartwalletapp/request/set_status.dart';
import 'package:smartwalletapp/response/card/createCardResponse.dart';
import 'package:smartwalletapp/response/contract/create_contract_reponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

class AllContractsList {
  List<GetContractResponse> libContracts;
  List<GetContractResponse> issueContracts;
  List<GetContractResponse> cardContracts;

  AllContractsList(this.libContracts, this.issueContracts, this.cardContracts);
}

class ContractRepository {
  Future<ApiResult> createdLibContract(
      CreateContractLiabRequest contract, String token) async {
    final String apiUrl = 'http://localhost:8080/smartwalletapp/contracts';
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
      CreateContractResponse contractr =
          CreateContractResponse.fromJson(responseData);
      if (response.statusCode == 200) {
        int newCode = contractr.retCode;
        String newMess = contractr.retMsg;
        ApiResult apiResult = ApiResult(newCode, newMess, contractr, 0, 0);
        return (apiResult);
      } else {
        throw Exception("Exception occurred:__${contractr.retMsg}");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<ApiResult> createdIssueContract(
      CreateContractV4ReqV2 contract, String token) async {
    final String apiUrl =
        'http://localhost:8080/smartwalletapp/contracts/children';
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
      if (response.statusCode == 200) {
        CreateContractResponse contract =
            CreateContractResponse.fromJson(responseData);
        print("_______contract_________${contract.toString()}");
        int newCode = contract.retCode;
        print("________new code________________$newCode");
        String newMess = contract.retMsg;
        print("________new mess__________$newMess");
        ApiResult apiResult = ApiResult(newCode, newMess, contract, 0, 0);
        return (apiResult);
      } else {
        throw Exception("Exception occurred:__$contract.retMsg");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<ApiResult> createdCardContract(
      CreateCardV3 contract, String token) async {
    final String apiUrl = 'http://localhost:8080/smartwalletapp/card';
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
      if (response.statusCode == 200) {
        CreateCardReponse contract = CreateCardReponse.fromJson(responseData);
        print("_______contract_________${contract.toString()}");
        int newCode = contract.retCode;
        print("________new code________________$newCode");
        String newMess = contract.retMsg;
        print("________new mess__________$newMess");
        ApiResult apiResult = ApiResult(newCode, newMess, contract, 0, 0);
        return (apiResult);
      } else {
        throw Exception("Exception occurred:__$contract.retMsg");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<ApiResult> giveContractByClient(
      String identityClient, String token) async {
    String apiUrl =
        "http://localhost:8080/smartwalletapp/contracts?identifier=$identityClient&type=ByClientID";

    try {
      print("Calling API: $apiUrl");

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // Kiểm tra mã status trước khi decode dữ liệu
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        int code = responseData["code"] ?? 0;
        String message = responseData["message"] ?? "No message";
        List<GetContractResponseCustom> libContracts =
            (responseData["result"] as List)
                .map((e) => GetContractResponseCustom.fromJson(e))
                .toList();
        return ApiResult(code, message, libContracts, 1, 1);
      } else {
        throw Exception(
            "Lỗi API: ContractRepositor giveContractByClient ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối ContractRepositor giveContractByClient: $e");
    }
  }

  Future<ApiResult> getContractByContractNumber(
      String cardNumber, String token) async {
    String apiUrl =
        "http://localhost:8080/smartwalletapp/contracts?identifier=$cardNumber&type=ByCardNumber";
    print(apiUrl);

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // Kiểm tra mã status trước khi decode dữ liệu
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        int code = responseData["code"] ?? 0;
        String message = responseData["message"] ?? "No message";
        GetContractResponse libContracts =
            GetContractResponse.fromJson(responseData["result"][0]);
        print(libContracts.toString());

        return ApiResult(code, message, libContracts, 1, 1);
      } else {
        throw Exception("Lỗi API: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception(
          "Lỗi kết nối hoặc dữ liệu không hợp lệ _ giveContractByContractNumber: $e");
    }
  }

  Future<ApiResult> giveAllContract(
      String token, int page, String search, int count) async {
    String apiUrl =
        "http://localhost:8080/smartwalletapp/contracts/search?query=$search&page=$page&count=$count";

    try {
      print("-------------------------1--------------------------");
      print("giveAllContract : $apiUrl");
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      int code = responseData["code"];
      String message = responseData["message"] ?? 'ok';
      if (response.statusCode == 200) {
        List<GetContractResponseCustom> libContracts =
            (responseData["result"][0]["contracts"] as List)
                .map((e) => GetContractResponseCustom.fromJson(e))
                .toList();
        print("-------------------------5--------------------------");
        int page = responseData["result"][0]["page"];
        print(page);
        int pageTotal = responseData["result"][0]["pageTotal"];
        print(pageTotal);

        ApiResult result =
            ApiResult(code, message, libContracts, page, pageTotal);
        return result;
      } else {
        // Map<String, dynamic> errorData = json.decode(response.body);
        // throw Exception("Lỗi API: ${errorData["message"]}");
        throw Exception("Exception occurred giveAllContract:__$message");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: giveAllContract $e");
    }
  }

  Future<ApiResult> editContract(EditContractV4 contract, String token) async {
    final String apiUrl = 'http://localhost:8080/smartwalletapp/contracts';
    try {
      print(contract.toString());
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(contract.toJson()),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      print("_________________response_________$responseData");
      if (response.statusCode == 200) {
        CreateContractResponse contract =
            CreateContractResponse.fromJson(responseData);
        print("_______contract_________${contract.toString()}");
        int newCode = contract.retCode;
        print("________new code________________$newCode");
        String newMess = contract.retMsg;
        print("________new mess__________$newMess");
        ApiResult apiResult = ApiResult(newCode, newMess, contract, 0, 0);
        return (apiResult);
      } else {
        throw Exception("Exception occurred:__$responseData");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<ApiResult> setStatusContract(SetStatus request, String token) async {
    final String apiUrl = 'http://localhost:8080/smartwalletapp/card/status';
    try {
      print(request.toString());
      final response = await http.patch(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      print("_________________response_________$responseData");
      if (response.statusCode == 200) {
        CreateContractResponse contract =
            CreateContractResponse.fromJson(responseData);
        print("_______contract_________${contract.toString()}");
        int newCode = contract.retCode;
        print("________new code________________$newCode");
        String newMess = contract.retMsg;
        print("________new mess__________$newMess");
        ApiResult apiResult = ApiResult(newCode, newMess, contract, 0, 0);
        return (apiResult);
      } else {
        throw Exception("Exception occurred:__$responseData");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<ApiResult> activateContract(ActivateCard request, String token) async {
    final String apiUrl = 'http://localhost:8080/smartwalletapp/card/activate';
    try {
      print(request.toString());
      final response = await http.patch(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      print("_________________response_________$responseData");
      if (response.statusCode == 200) {
        CreateContractResponse contract =
            CreateContractResponse.fromJson(responseData);
        print("_______contract_________${contract.toString()}");
        int newCode = contract.retCode;
        print("________new code________________$newCode");
        String newMess = contract.retMsg;
        print("________new mess__________$newMess");
        ApiResult apiResult = ApiResult(newCode, newMess, contract, 0, 0);
        return (apiResult);
      } else {
        throw Exception("Exception occurred:__$responseData");
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }
}
