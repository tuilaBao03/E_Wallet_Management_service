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
      'liabCategory': liabCategory,
      'liabContractSearchMethod': liabContractSearchMethod,
      'liabContractIdentifier': liabContractIdentifier,
      'clientSearchMethod': clientSearchMethod,
      'clientIdentifier': clientIdentifier,
      'productCode': productCode,
      'productCode2': productCode2,
      'productCode3': productCode3,
      'inObject': inObject.toJson(),
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
      'branch': branch,
      'institutionCode': institutionCode,
      'contractName': contractName,
      'cbsNumber': cbsNumber,
      'addInfo01': addInfo01,
      'addInfo02': addInfo02,
    };
  }
}
