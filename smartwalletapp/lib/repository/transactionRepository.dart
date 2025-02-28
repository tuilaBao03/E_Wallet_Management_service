import 'dart:convert';
import 'package:smartwalletapp/ApiResult.dart';
import 'package:http/http.dart' as http;
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';

class TransactionRepository {

  Future<ApiResult> giveCardByContract( String token, Contract contract) async {
    String apiUrl = "http://localhost:8080/smartwalletapp//${contract.contractID}/transaction";
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
        List<Transaction> trans = responseData["result"];
        ApiResult result = ApiResult(code, message, trans, 0,0);
        return result;
      } else {
        Map<String, dynamic> errorData = json.decode(response.body);
        throw Exception("Lỗi API: ${errorData["message"]}");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
  

}