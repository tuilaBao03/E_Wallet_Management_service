class CreateCardReponse {
  String? createdCard;
  String? cardNumber;
  String? expiryDate;
  String? sequenceNumber;
  int? retCode;
  String? retMsg;
  String? resultInfo;

  CreateCardReponse({
    this.createdCard,
    this.cardNumber,
    this.expiryDate,
    this.sequenceNumber,
    this.retCode,
    this.retMsg,
    this.resultInfo,
  });

  // fromJson
  factory CreateCardReponse.fromJson(Map<String, dynamic> json) {
    return CreateCardReponse(
      createdCard: json['createdCard'],
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      sequenceNumber: json['SequenceNumber'], // lưu ý tên key
      retCode: json['retCode'],
      retMsg: json['retMsg'],
      resultInfo: json['resultInfo'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'createdCard': createdCard,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'SequenceNumber': sequenceNumber, // giữ nguyên theo backend
      'retCode': retCode,
      'retMsg': retMsg,
      'resultInfo': resultInfo,
    };
  }

  // toString
  @override
  String toString() {
    return 'CreateCardReponse(createdCard: $createdCard, cardNumber: $cardNumber, expiryDate: $expiryDate, sequenceNumber: $sequenceNumber, retCode: $retCode, retMsg: $retMsg, resultInfo: $resultInfo)';
  }
}
