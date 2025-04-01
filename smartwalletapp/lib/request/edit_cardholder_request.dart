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
        'ClientSearchMethod': clientSearchMethod,
        'ClientIdentifier': clientIdentifier,
        'Reason': reason,
        'EditClient_InObject': editClientInObject.toJson(),
        'SetCustomData_InObject': setCustomDataInObject.toJson(),
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
        'Branch': branch,
        'ClientCategory': clientCategory,
        'ServiceGroup': serviceGroup,
        'ProductCategory': productCategory,
        'ClientTypeCode': clientTypeCode,
        'ShortName': shortName,
        'SalutationCode': salutationCode,
        'SalutationSuffix': salutationSuffix,
        'Gender': gender,
        'FirstName': firstName,
        'MiddleName': middleName,
        'LastName': lastName,
        'BirthDate': birthDate,
        'BirthPlace': birthPlace,
        'BirthName': birthName,
        'LanguageCode': languageCode,
        'Citizenship': citizenship,
        'MaritalStatusCode': maritalStatusCode,
        'TaxBracket': taxBracket,
        'IndividualTaxpayerNumber': individualTaxpayerNumber,
        'DateExpire': dateExpire,
        'HomePhone': homePhone,
        'MobilePhone': mobilePhone,
        'BusinessPhone': businessPhone,
        'EMail': email,
        'Country': country,
        'State': state,
        'City': city,
        'AddressZIP': addressZip,
        'AddressLine1': addressLine1,
        'Profession': profession,
        'EmbossedLastName': embossedLastName,
        'EmbossedFirstName': embossedFirstName,
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
        'AddInfoType': addInfoType,
        'RemoveTag': removeTag,
        'TagName': tagName,
        'TagValue': tagValue,
      };
}