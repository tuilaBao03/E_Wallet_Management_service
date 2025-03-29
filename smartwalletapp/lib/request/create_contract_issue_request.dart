// ignore_for_file: file_names

class CreateContractV4ReqV2 {
  String liabCategory;
  String liabContractSearchMethod;
  String liabContractIdentifier;
  String clientSearchMethod;
  String clientIdentifier;
  String productCode;
  String productCode2;
  String productCode3;
  InObject inObject;

  CreateContractV4ReqV2({
    required this.liabCategory,
    required this.liabContractSearchMethod,
    required this.liabContractIdentifier,
    required this.clientSearchMethod,
    required this.clientIdentifier,
    required this.productCode,
    required this.productCode2,
    required this.productCode3,
    required this.inObject,
  });

  Map<String, dynamic> toJson() {
    return {
      'LiabCategory': liabCategory,
      'LiabContractSearchMethod': liabContractSearchMethod,
      'LiabContractIdentifier': liabContractIdentifier,
      'ClientSearchMethod': clientSearchMethod,
      'ClientIdentifier': clientIdentifier,
      'ProductCode': productCode,
      'ProductCode2': productCode2,
      'ProductCode3': productCode3,
      'InObject': inObject.toJson(),
    };
  }
}

class InObject {
  String branch;
  String institutionCode;
  String contractName;
  String cbsNumber;
  String addInfo01;
  String addInfo02;

  InObject({
    required this.branch,
    required this.institutionCode,
    required this.contractName,
    required this.cbsNumber,
    required this.addInfo01,
    required this.addInfo02,
  });

  Map<String, dynamic> toJson() {
    return {
      'Branch': branch,
      'InstitutionCode': institutionCode,
      'ContractName': contractName,
      'CBSNumber': cbsNumber,
      'AddInfo01': addInfo01,
      'AddInfo02': addInfo02,
    };
  }
}
