class CardHolderResponse {
  String newClient;
  String applicationNumber;
  int retCode;
  String retMsg;
  String resultInfo;

  CardHolderResponse({
    required this.newClient,
    required this.applicationNumber,
    required this.retCode,
    required this.retMsg,
    required this.resultInfo,
  });

  // Factory để parse từ JSON (nếu từ API về)
  factory CardHolderResponse.fromJson(Map<String, dynamic> json) {
    return CardHolderResponse(
      newClient: json['newClient'] ?? '',
      applicationNumber: json['applicationNumber']  ?? '',
      retCode: json['retCode'] ?? '',
      retMsg: json['retMsg'] ?? '',
      resultInfo: json['resultInfo'] ?? '',
    );
  }

  // Chuyển về JSON nếu cần gửi đi hoặc lưu
  Map<String, dynamic> toJson() {
    return {
      'NewClient': newClient,
      'ApplicationNumber': applicationNumber,
      'RetCode': retCode,
      'RetMsg': retMsg,
      'ResultInfo': resultInfo,
    };
  }
}
