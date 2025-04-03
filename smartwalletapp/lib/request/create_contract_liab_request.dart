class CreateContractLiabRequest {
  String reason;
  String clientIdentifier;
  String clientSearchMethod;
  CreateContractInObject contractInfo;
  String customData;

  // Constructor
  CreateContractLiabRequest({
    required this.reason,
    required this.clientIdentifier,
    required this.clientSearchMethod,
    required this.contractInfo,
    required this.customData,
  });

  // Parse từ JSON
  factory CreateContractLiabRequest.fromJson(Map<String, dynamic> json) {
    return CreateContractLiabRequest(
      reason: json['Reason'] ?? '',
      clientIdentifier: json['ClientIdentifier'] ?? '',
      clientSearchMethod: json['ClientSearchMethod'] ?? '',
      contractInfo: CreateContractInObject.fromJson(json['CreateContract_InObject'] ?? {}),
      customData: json['CustomData'] ?? '',
    );
  }

  // Chuyển về JSON
  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'clientIdentifier': clientIdentifier,
      'clientSearchMethod': clientSearchMethod,
      'createContractInObject': contractInfo.toJson(),
      'setCustomDataInObject': customData,
    };
  }
  String toString() {
    return 'CreateContractRequest(reason: $reason, clientIdentifier: $clientIdentifier, clientSearchMethod: $clientSearchMethod, contractInfo: $contractInfo, customData: $customData)';
  }
}
class CreateContractInObject {
  String branch;
  String institutionCode;
  String productCode;
  String productCode2;
  String productCode3;
  String contractName;
  String cbsNumber;

  // Constructor
  CreateContractInObject({
    required this.branch,
    required this.institutionCode,
    required this.productCode,
    required this.productCode2,
    required this.productCode3,
    required this.contractName,
    required this.cbsNumber,
  });

  // Parse từ JSON
  factory CreateContractInObject.fromJson(Map<String, dynamic> json) {
    return CreateContractInObject(
      branch: json['branch'] ?? '',
      institutionCode: json['institutionCode'] ?? '',
      productCode: json['productCode'] ?? '',
      productCode2: json['productCode2'] ?? '',
      productCode3: json['productCode3'] ?? '',
      contractName: json['contractName'] ?? '',
      cbsNumber: json['CBSNumber'] ?? '',
    );
  }

  // Chuyển về JSON
  Map<String, dynamic> toJson() {
    return {
      'branch': branch,
      'institutionCode': institutionCode,
      'productCode': productCode,
      'productCode2': productCode2,
      'productCode3': productCode3,
      'contractName': contractName,
      'cbsNumber': cbsNumber,
    };
  }

  @override
  String toString() {
    return 'CreateContractInObject(branch: $branch, institutionCode: $institutionCode, productCode: $productCode, productCode2: $productCode2, productCode3: $productCode3, contractName: $contractName, cbsNumber: $cbsNumber)';
  }
}
