class EditContractV4 {
  String contractSearchMethod;
  String contractIdentifier;
  String reason;
  EditContractInObjectEditV4 editContractInObject;
  SetCustomDataInObjectEditV4 customData;

  EditContractV4({
    required this.contractSearchMethod,
    required this.contractIdentifier,
    required this.reason,
    required this.editContractInObject,
    required this.customData,
  });

  Map<String, dynamic> toJson() => {
        'contractSearchMethod': contractSearchMethod,
        'contractIdentifier': contractIdentifier,
        'reason': reason,
        'editContractInObject': editContractInObject.toJson(),
        'customData': customData.toJson(),
      };
}

class EditContractInObjectEditV4 {
  String branch;
  String serviceGroup;
  String contractNumber;
  String contractName;
  String cbsId;
  String cbsNumber;
  String closeDate;

  EditContractInObjectEditV4({
    required this.branch,
    required this.serviceGroup,
    required this.contractNumber,
    required this.contractName,
    required this.cbsId,
    required this.cbsNumber,
    required this.closeDate,
  });

  Map<String, dynamic> toJson() => {
        'branch': branch,
        'serviceGroup': serviceGroup,
        'contractNumber': contractNumber,
        'contractName': contractName,
        'cbsID': cbsId,
        'cbsNumber': cbsNumber,
        'closeDate': closeDate,
      };
}

class SetCustomDataInObjectEditV4 {
  String addInfoType;
  String removeTag;
  String tagName;
  String tagValue;

  SetCustomDataInObjectEditV4({
    required this.addInfoType,
    required this.removeTag,
    required this.tagName,
    required this.tagValue,
  });

  Map<String, dynamic> toJson() => {
        'addInfoType': addInfoType,
        'removeTag': removeTag,
        'tagName': tagName,
        'tagValue': tagValue,
      };
}
