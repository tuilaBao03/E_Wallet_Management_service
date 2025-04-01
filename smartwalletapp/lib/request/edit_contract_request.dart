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
        'ContractSearchMethod': contractSearchMethod,
        'ContractIdentifier': contractIdentifier,
        'Reason': reason,
        'EditContract_InObject': editContractInObject.toJson(),
        'SetCustomData_InObject': customData.toJson(),
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
        'Branch': branch,
        'ServiceGroup': serviceGroup,
        'ContractNumber': contractNumber,
        'ContractName': contractName,
        'CBSID': cbsId,
        'CBSNumber': cbsNumber,
        'CloseDate': closeDate,
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
        'AddInfoType': addInfoType,
        'RemoveTag': removeTag,
        'TagName': tagName,
        'TagValue': tagValue,
      };
}
