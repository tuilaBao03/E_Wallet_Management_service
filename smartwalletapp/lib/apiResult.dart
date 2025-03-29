// ignore_for_file: file_names

class ApiResult {
  final int code;
  final String message;
  final dynamic result;
  final int page;
  final int pageTotal;

  ApiResult(this.code,this.message,this.result, this.page, this.pageTotal); 

  // Thêm phương thức toString() để debug dễ dàng
  @override
  String toString() {
    return 'ApiResult(code: $code, message: $message, result: ${result.toString()}, page: $page, pageAmount: $pageTotal)';
  }
}