// ignore_for_file: file_names

class ApiResult {
  final int code;
  final String message;
  final dynamic result;
  final int page;
  final int pageAmount;

  ApiResult(this.code,this.message,this.result, this.page, this.pageAmount); 

}