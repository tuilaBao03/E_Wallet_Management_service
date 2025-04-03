import 'dart:convert';

class CreateCardV3 {
  String contractSearchMethod;
  String contractIdentifier;
  String productCode;
  String productCode2;
  String productCode3;
  InObjectCard inObject;

  CreateCardV3({
    required this.contractSearchMethod,
    required this.contractIdentifier,
    required this.productCode,
    required this.productCode2,
    required this.productCode3,
    required this.inObject,
  });

  factory CreateCardV3.fromJson(Map<String, dynamic> json) {
    return CreateCardV3(
      contractSearchMethod: json['contractSearchMethod'],
      contractIdentifier: json['contractIdentifier'],
      productCode: json['productCode'],
      productCode2: json['productCode2'],
      productCode3: json['productCode3'],
      inObject: InObjectCard.fromJson(json['inObject']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contractSearchMethod': contractSearchMethod,
      'contractIdentifier': contractIdentifier,
      'productCode': productCode,
      'productCode2': productCode2,
      'productCode3': productCode3,
      'inObject': inObject.toJson(),
    };
  }
}

class InObjectCard {
  String cardName;
  String cbsNumber;
  String embossedFirstName;
  String embossedLastName;
  String embossedCompanyName;

  InObjectCard({
    required this.cardName,
    required this.cbsNumber,
    required this.embossedFirstName,
    required this.embossedLastName,
    required this.embossedCompanyName,
  });

  factory InObjectCard.fromJson(Map<String, dynamic> json) {
    return InObjectCard(
      cardName: json['CardName'],
      cbsNumber: json['CBSNumber'],
      embossedFirstName: json['EmbossedFirstName'],
      embossedLastName: json['EmbossedLastName'],
      embossedCompanyName: json['EmbossedCompanyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardName': cardName,
      'cbdNumber': cbsNumber,
      'embossedFirstName': embossedFirstName,
      'embossedLastName': embossedLastName,
      'embossedCompanyName': embossedCompanyName,
    };
  }
}