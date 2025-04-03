import 'dart:convert';

class CreateClientV4Body {
  String reason;
  CreateClientInObject createClientInObject;
  List<SetCustomDataInObject> setCustomDataInObjects;

  CreateClientV4Body({
    required this.reason,
    required this.createClientInObject,
    required this.setCustomDataInObjects,
  });

  factory CreateClientV4Body.fromJson(Map<String, dynamic> json) {
    return CreateClientV4Body(
      reason: json['reason'],
      createClientInObject: CreateClientInObject.fromJson(json['createClientInObject'] ?? {}),
      setCustomDataInObjects: json['setCustomDataInObjects'] != null
          ? (json['setCustomDataInObjects'] as List)
              .map((e) => SetCustomDataInObject.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'createClientInObject': createClientInObject.toJson(),
      'setCustomDataInObjects': setCustomDataInObjects.map((e) => e.toJson()).toList(),
    };
  }
}

class CreateClientInObject {
  String institutionCode;
  String branch;
  String clientTypeCode;
  String? clientCategory;
  String? serviceGroup;
  String? productCategory;
  String? languageCode;
  String? salutationSuffix;
  String shortName;
  String firstName;
  String lastName;
  String middleName;
  String maritalStatusCode;
  String socialSecurityNumber;
  String salutationCode;
  String birthDate;
  String gender;
  String? birthPlace;
  String? birthName;
  String citizenship;
  String? taxBracket;
  String individualTaxpayerNumber;
  String? secretPhrase;
  String companyName;
  String? trademark;
  String? department;
  String? embossedTitleCode;
  String? embossedFirstName;
  String? embossedLastName;
  String? embossedCompanyName;
  String? identityCardType;
  String identityCardNumber;
  String identityCardDetails;
  String clientNumber;
  String profession;
  String email;
  String addressLine1;
  String? addressLine2;
  String? addressLine3;
  String? addressLine4;
  String city;
  String homePhone;
  String mobilePhone;
  String? businessPhone;

  CreateClientInObject({
    required this.institutionCode,
    required this.branch,
    required this.clientTypeCode,
    this.clientCategory,
    this.serviceGroup,
    this.productCategory,
    this.languageCode,
    this.salutationSuffix,
    required this.shortName,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.maritalStatusCode,
    required this.socialSecurityNumber,
    required this.salutationCode,
    required this.birthDate,
    required this.gender,
    this.birthPlace,
    this.birthName,
    required this.citizenship,
    this.taxBracket,
    required this.individualTaxpayerNumber,
    this.secretPhrase,
    required this.companyName,
    this.trademark,
    this.department,
    this.embossedTitleCode,
    this.embossedFirstName,
    this.embossedLastName,
    this.embossedCompanyName,
    this.identityCardType,
    required this.identityCardNumber,
    required this.identityCardDetails,
    required this.clientNumber,
    required this.profession,
    required this.email,
    required this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    required this.city,
    required this.homePhone,
    required this.mobilePhone,
    this.businessPhone,
  });

  factory CreateClientInObject.fromJson(Map<String, dynamic> json) {
    return CreateClientInObject(
      institutionCode: json['institutionCode'],
      branch: json['branch'],
      clientTypeCode: json['clientTypeCode'],
      clientCategory: json['clientCategory'],
      serviceGroup: json['serviceGroup'],
      productCategory: json['productCategory'],
      languageCode: json['languageCode'],
      salutationSuffix: json['salutationSuffix'],
      shortName: json['shortName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      maritalStatusCode: json['maritalStatusCode'],
      socialSecurityNumber: json['socialSecurityNumber'],
      salutationCode: json['salutationCode'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      birthPlace: json['birthPlace'],
      birthName: json['birthName'],
      citizenship: json['citizenship'],
      taxBracket: json['taxBracket'],
      individualTaxpayerNumber: json['individualTaxpayerNumber'],
      secretPhrase: json['secretPhrase'],
      companyName: json['companyName'],
      trademark: json['trademark'],
      department: json['department'],
      embossedTitleCode: json['embossedTitleCode'],
      embossedFirstName: json['embossedFirstName'],
      embossedLastName: json['embossedLastName'],
      embossedCompanyName: json['embossedCompanyName'],
      identityCardType: json['identityCardType'],
      identityCardNumber: json['identityCardNumber'],
      identityCardDetails: json['identityCardDetails'],
      clientNumber: json['clientNumber'],
      profession: json['profession'],
      email: json['eMail'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      addressLine3: json['addressLine3'],
      addressLine4: json['addressLine4'],
      city: json['city'],
      homePhone: json['homePhone'],
      mobilePhone: json['mobilePhone'],
      businessPhone: json['businessPhone'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'institutionCode': institutionCode,
      'branch': branch,
      'clientTypeCode': clientTypeCode,
      'clientCategory': clientCategory,
      'serviceGroup': serviceGroup,
      'productCategory': productCategory,
      'languageCode': languageCode,
      'salutationSuffix': salutationSuffix,
      'shortName': shortName,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'maritalStatusCode': maritalStatusCode,
      'socialSecurityNumber': socialSecurityNumber,
      'salutationCode': salutationCode,
      'birthDate': birthDate,
      'gender': gender,
      'birthPlace': birthPlace,
      'birthName': birthName,
      'citizenship': citizenship,
      'taxBracket': taxBracket,
      'individualTaxpayerNumber': individualTaxpayerNumber,
      'secretPhrase': secretPhrase,
      'companyName': companyName,
      'trademark': trademark,
      'department': department,
      'embossedTitleCode': embossedTitleCode,
      'embossedFirstName': embossedFirstName,
      'embossedLastName': embossedLastName,
      'embossedCompanyName': embossedCompanyName,
      'identityCardType': identityCardType,
      'identityCardNumber': identityCardNumber,
      'identityCardDetails': identityCardDetails,
      'clientNumber': clientNumber,
      'profession': profession,
      'eMail': email,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressLine3': addressLine3,
      'addressLine4': addressLine4,
      'city': city,
      'homePhone': homePhone,
      'mobilePhone': mobilePhone,
      'businessPhone': businessPhone,
    };
  }

}

class SetCustomDataInObject {
  String? addInfoType;
  String? tagName;
  String? tagValue;

  SetCustomDataInObject({this.addInfoType, this.tagName, this.tagValue});

  factory SetCustomDataInObject.fromJson(Map<String, dynamic> json) {
    return SetCustomDataInObject(
      addInfoType: json['addInfoType'],
      tagName: json['tagName'],
      tagValue: json['tagValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addInfoType': addInfoType,
      'tagName': tagName,
      'tagValue': tagValue,
    };
  }
}
