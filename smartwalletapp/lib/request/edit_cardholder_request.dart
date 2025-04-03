class EditClientV6 {
  String clientSearchMethod;
  String clientIdentifier;
  String reason;
  EditClientInObjectEditV6 editClientInObject;
  SetCustomDataInObjectEditV6 setCustomDataInObject;

  EditClientV6({
    required this.clientSearchMethod,
    required this.clientIdentifier,
    required this.reason,
    required this.editClientInObject,
    required this.setCustomDataInObject,
  });

  Map<String, dynamic> toJson() => {
        'clientSearchMethod': clientSearchMethod,
        'clientIdentifier': clientIdentifier,
        'reason': reason,
        'editClient_InObject': editClientInObject.toJson(),
        'setCustomData_InObject': setCustomDataInObject.toJson(),
      };
}

class EditClientInObjectEditV6 {
  String branch;
  String clientCategory;
  String serviceGroup;
  String productCategory;
  String clientTypeCode;
  String shortName;
  String salutationCode;
  String salutationSuffix;
  String gender;
  String firstName;
  String middleName;
  String lastName;
  String birthDate;
  String birthPlace;
  String birthName;
  String languageCode;
  String citizenship;
  String maritalStatusCode;
  String taxBracket;
  String individualTaxpayerNumber;
  String dateExpire;
  String homePhone;
  String mobilePhone;
  String businessPhone;
  String email;
  String country;
  String state;
  String city;
  String addressZip;
  String addressLine1;
  String profession;
  String embossedLastName;
  String embossedFirstName;

  EditClientInObjectEditV6({
    required this.branch,
    required this.clientCategory,
    required this.serviceGroup,
    required this.productCategory,
    required this.clientTypeCode,
    required this.shortName,
    required this.salutationCode,
    required this.salutationSuffix,
    required this.gender,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.birthDate,
    required this.birthPlace,
    required this.birthName,
    required this.languageCode,
    required this.citizenship,
    required this.maritalStatusCode,
    required this.taxBracket,
    required this.individualTaxpayerNumber,
    required this.dateExpire,
    required this.homePhone,
    required this.mobilePhone,
    required this.businessPhone,
    required this.email,
    required this.country,
    required this.state,
    required this.city,
    required this.addressZip,
    required this.addressLine1,
    required this.profession,
    required this.embossedLastName,
    required this.embossedFirstName, required String address,
  });

  Map<String, dynamic> toJson() => {
        'branch': branch,
        'clientCategory': clientCategory,
        'serviceGroup': serviceGroup,
        'productCategory': productCategory,
        'clientTypeCode': clientTypeCode,
        'shortName': shortName,
        'salutationCode': salutationCode,
        'salutationSuffix': salutationSuffix,
        'gender': gender,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'birthDate': birthDate,
        'birthPlace': birthPlace,
        'birthName': birthName,
        'languageCode': languageCode,
        'citizenship': citizenship,
        'maritalStatusCode': maritalStatusCode,
        'taxBracket': taxBracket,
        'individualTaxpayerNumber': individualTaxpayerNumber,
        'dateExpire': dateExpire,
        'homePhone': homePhone,
        'mobilePhone': mobilePhone,
        'businessPhone': businessPhone,
        'eMail': email,
        'country': country,
        'state': state,
        'city': city,
        'addressZIP': addressZip,
        'addressLine1': addressLine1,
        'profession': profession,
        'embossedLastName': embossedLastName,
        'embossedFirstName': embossedFirstName,
      };
}

class SetCustomDataInObjectEditV6 {
  String addInfoType;
  String removeTag;
  String tagName;
  String tagValue;

  SetCustomDataInObjectEditV6({
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