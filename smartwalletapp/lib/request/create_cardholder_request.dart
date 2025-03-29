// ignore_for_file: non_constant_identifier_names, unnecessary_cast



import 'package:flutter/material.dart';
import 'package:smartwalletapp/request/card_holder_data.dart';

class CreateCardHolderRequest {
  String reason;
  String institutionCode;
  String branch;
  String clientTypeCode;
  String clientCategory;
  String serviceGroup;
  String productCategory;
  String languageCode;
  String salutationSuffix;
  String shortName;
  String firstName;
  String lastName;
  String middleName;
  String maritalStatusCode;
  String socialSecurityNumber;
  String salutationCode;
  DateTime birthDate;
  String gender;
  String birthPlace;
  String birthName;
  String citizenship;
  String taxBracket;
  String individualTaxpayerNumber;
  String secretPhrase;
  String companyName;
  String trademark;
  String department;
  String embossedTitleCode;
  String embossedFirstName;
  String embossedLastName;
  String embossedCompanyName;
  String identityCardType;
  String identityCardNumber;
  String identityCardDetails;
  String clientNumber;
  String profession;
  String eMail;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String addressLine4;
  String city;
  String homePhone;
  String mobilePhone;
  String businessPhone;
  List<SetCustomDataInObjectJson> customData;

  CreateCardHolderRequest({
    required this.reason,
    required this.institutionCode,
    required this.branch,
    required this.clientTypeCode,
    required this.clientCategory,
    required this.serviceGroup,
    required this.productCategory,
    required this.languageCode,
    required this.salutationSuffix,
    required this.shortName,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.maritalStatusCode,
    required this.socialSecurityNumber,
    required this.salutationCode,
    required this.birthDate,
    required this.gender,
    required this.birthPlace,
    required this.birthName,
    required this.citizenship,
    required this.taxBracket,
    required this.individualTaxpayerNumber,
    required this.secretPhrase,
    required this.companyName,
    required this.trademark,
    required this.department,
    required this.embossedTitleCode,
    required this.embossedFirstName,
    required this.embossedLastName,
    required this.embossedCompanyName,
    required this.identityCardType,
    required this.identityCardNumber,
    required this.identityCardDetails,
    required this.clientNumber,
    required this.profession,
    required this.eMail,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.addressLine4,
    required this.city,
    required this.homePhone,
    required this.mobilePhone,
    required this.businessPhone,
    required this.customData,
  });

  factory CreateCardHolderRequest.fromJson(Map<String, dynamic> json) {
    return CreateCardHolderRequest(
      reason: json['reason'],
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
      eMail: json['eMail'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      addressLine3: json['addressLine3'],
      addressLine4: json['addressLine4'],
      city: json['city'],
      homePhone: json['homePhone'],
      mobilePhone: json['mobilePhone'],
      businessPhone: json['businessPhone'],
      customData: (json['customData'] as List<dynamic>)
          .map((e) => SetCustomDataInObjectJson.fromJson(e))
          .toList(),
    );
  }
  String formatDateOnly(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}
  Map<String, dynamic> toJson() {
  return {
    "reason": reason,
    "institutionCode": institutionCode,
    "branch": branch,
    "clientTypeCode": clientTypeCode,
    "clientCategory": clientCategory,
    "serviceGroup": serviceGroup,
    "productCategory": productCategory,
    "languageCode": languageCode,
    "salutationSuffix": salutationSuffix,
    "shortName": shortName,
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "maritalStatusCode": maritalStatusCode,
    "socialSecurityNumber": socialSecurityNumber,
    "salutationCode": salutationCode,
    "birthDate": formatDateOnly(birthDate),
    "gender": gender,
    "birthPlace": birthPlace,
    "birthName": birthName,
    "citizenship": citizenship,
    "taxBracket": taxBracket,
    "individualTaxpayerNumber": individualTaxpayerNumber,
    "secretPhrase": secretPhrase,
    "companyName": companyName,
    "trademark": trademark,
    "department": department,
    "embossedTitleCode": embossedTitleCode,
    "embossedFirstName": embossedFirstName,
    "embossedLastName": embossedLastName,
    "embossedCompanyName": embossedCompanyName,
    "identityCardType": identityCardType,
    "identityCardNumber": identityCardNumber,
    "identityCardDetails": identityCardDetails,
    "clientNumber": clientNumber,
    "profession": profession,
    "eMail": eMail,
    "addressLine1": addressLine1,
    "addressLine2": addressLine2,
    "addressLine3": addressLine3,
    "addressLine4": addressLine4,
    "city": city,
    "homePhone": homePhone,
    "mobilePhone": mobilePhone,
    "businessPhone": businessPhone,
    "customData": toCustomDataJson(),
  };
}

  
  List<Map<String, dynamic>> toCustomDataJson() {
    return customData.map((e) => {
      "addInfoType": e.addInfoType,
      "tagName": e.tagName,
      "tagValue": e.tagValue,
    }).toList();
  }/// ✅ Thêm hàm static getFieldNames
  static List<String> getFieldNames() {
    return [
      'reason',
      'institutionCode',
      'branch',
      'clientTypeCode',
      'clientCategory',
      'serviceGroup',
      'productCategory',
      'languageCode',
      'salutationSuffix',
      'shortName',
      'firstName',
      'lastName',
      'middleName',
      'maritalStatusCode',
      'socialSecurityNumber',
      'salutationCode',
      'birthDate',
      'gender',
      'birthPlace',
      'birthName',
      'citizenship',
      'taxBracket',
      'individualTaxpayerNumber',
      'secretPhrase',
      'companyName',
      'trademark',
      'department',
      'embossedTitleCode',
      'embossedFirstName',
      'embossedLastName',
      'embossedCompanyName',
      'identityCardType',
      'identityCardNumber',
      'identityCardDetails',
      'clientNumber',
      'profession',
      'eMail',
      'addressLine1',
      'addressLine2',
      'addressLine3',
      'addressLine4',
      'city',
      'homePhone',
      'mobilePhone',
      'businessPhone',
      // Không thêm customData vì xử lý riêng
    ];
  }
  void setValueByField(String field, String value) {
  switch (field) {
    case 'reason':
      reason = value;
      break;
    case 'institutionCode':
      institutionCode = value.padLeft(4, '0'); // Ensure "0001"
      break;
    case 'branch':
      branch = value.padLeft(4, '0'); // Ensure "0101"
      break;
    case 'clientTypeCode':
      clientTypeCode = value;
      break;
    case 'clientCategory':
      clientCategory = value;
      break;
    case 'serviceGroup':
      serviceGroup = value;
      break;
    case 'productCategory':
      productCategory = value;
      break;
    case 'languageCode':
      languageCode = value;
      break;
    case 'salutationSuffix':
      salutationSuffix = value;
      break;
    case 'shortName':
      shortName = value;
      break;
    case 'firstName':
      firstName = value;
      break;
    case 'lastName':
      lastName = value;
      break;
    case 'middleName':
      middleName = value;
      break;
    case 'maritalStatusCode':
      maritalStatusCode = value;
      break;
    case 'socialSecurityNumber':
      socialSecurityNumber = value;
      break;
    case 'salutationCode':
      salutationCode = value;
      break;
    case 'birthDate':
      // ignore: unnecessary_cast
      birthDate = formatDate(value) as DateTime;
      break;
    case 'gender':
      gender = value;
      break;
    case 'birthPlace':
      birthPlace = value;
      break;
    case 'birthName':
      birthName = value;
      break;
    case 'citizenship':
      citizenship = value;
      break;
    case 'taxBracket':
      taxBracket = value;
      break;
    case 'individualTaxpayerNumber':
      individualTaxpayerNumber = value as String;
      break;
    case 'secretPhrase':
      secretPhrase = value;
      break;
    case 'companyName':
      companyName = value;
      break;
    case 'trademark':
      trademark = value;
      break;
    case 'department':
      department = value;
      break;
    case 'embossedTitleCode':
      embossedTitleCode = value;
      break;
    case 'embossedFirstName':
      embossedFirstName = value;
      break;
    case 'embossedLastName':
      embossedLastName = value;
      break;
    case 'embossedCompanyName':
      embossedCompanyName = value;
      break;
    case 'identityCardType':
      identityCardType = value;
      break;
    case 'identityCardNumber':
      identityCardNumber = value as String;
      break;
    case 'identityCardDetails':
      identityCardDetails = value;
      break;
    case 'clientNumber':
      clientNumber = value as String;
      break;
    case 'profession':
      profession = value;
      break;
    case 'eMail':
      eMail = value;
      break;
    case 'addressLine1':
      addressLine1 = value;
      break;
    case 'addressLine2':
      addressLine2 = value;
      break;
    case 'addressLine3':
      addressLine3 = value;
      break;
    case 'addressLine4':
      addressLine4 = value;
      break;
    case 'city':
      city = value;
      break;
    case 'homePhone':
      homePhone = value;
      break;
    case 'mobilePhone':
      mobilePhone = value;
      break;
    case 'businessPhone':
      businessPhone = value;
      break;
  }
}

// Hàm format date "yyyy-MM-dd"
String formatDate(String input) {
  try {
    DateTime dt = DateTime.parse(input);
    return "${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
  } catch (e) {
    return input; // Nếu không parse được thì giữ nguyên
  }
}

}
extension CardHolderCopyWithFromControllers on CreateCardHolderRequest {
  CreateCardHolderRequest copyWith({
    String? reason,
    int? institutionCode,
    int? branch,
    String? clientTypeCode,
    String? clientCategory,
    String? serviceGroup,
    String? productCategory,
    String? languageCode,
    String? salutationSuffix,
    String? shortName,
    String? firstName,
    String? lastName,
    String? middleName,
    String? maritalStatusCode,
    int? socialSecurityNumber,
    String? salutationCode,
    DateTime? birthDate,
    String? gender,
    String? birthPlace,
    String? birthName,
    String? citizenship,
    String? taxBracket,
    int? individualTaxpayerNumber,
    String? secretPhrase,
    String? companyName,
    String? trademark,
    String? department,
    String? embossedTitleCode,
    String? embossedFirstName,
    String? embossedLastName,
    String? embossedCompanyName,
    String? identityCardType,
    int? identityCardNumber,
    String? identityCardDetails,
    int? clientNumber,
    String? profession,
    String? eMail,
    String? addressLine1,
    String? addressLine2,
    String? addressLine3,
    String? addressLine4,
    String? city,
    String? homePhone,
    String? mobilePhone,
    String? businessPhone,
    List<SetCustomDataInObjectJson>? customData,
  }) {
    return CreateCardHolderRequest(
      reason: reason ?? this.reason,
      institutionCode: this.institutionCode,
      branch: this.branch,
      clientTypeCode: clientTypeCode ?? this.clientTypeCode,
      clientCategory: clientCategory ?? this.clientCategory,
      serviceGroup: serviceGroup ?? this.serviceGroup,
      productCategory: productCategory ?? this.productCategory,
      languageCode: languageCode ?? this.languageCode,
      salutationSuffix: salutationSuffix ?? this.salutationSuffix,
      shortName: shortName ?? this.shortName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      maritalStatusCode: maritalStatusCode ?? this.maritalStatusCode,
      socialSecurityNumber: this.socialSecurityNumber,
      salutationCode: salutationCode ?? this.salutationCode,
      birthDate: this.birthDate,
      gender: gender ?? this.gender,
      birthPlace: birthPlace ?? this.birthPlace,
      birthName: birthName ?? this.birthName,
      citizenship: citizenship ?? this.citizenship,
      taxBracket: taxBracket ?? this.taxBracket,
      individualTaxpayerNumber: this.individualTaxpayerNumber,
      secretPhrase: secretPhrase ?? this.secretPhrase,
      companyName: companyName ?? this.companyName,
      trademark: trademark ?? this.trademark,
      department: department ?? this.department,
      embossedTitleCode: embossedTitleCode ?? this.embossedTitleCode,
      embossedFirstName: embossedFirstName ?? this.embossedFirstName,
      embossedLastName: embossedLastName ?? this.embossedLastName,
      embossedCompanyName: embossedCompanyName ?? this.embossedCompanyName,
      identityCardType: identityCardType ?? this.identityCardType,
      identityCardNumber: this.identityCardNumber,
      identityCardDetails: identityCardDetails ?? this.identityCardDetails,
      clientNumber:this.clientNumber,
      profession: profession ?? this.profession,
      eMail: eMail ?? this.eMail,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressLine3: addressLine3 ?? this.addressLine3,
      addressLine4: addressLine4 ?? this.addressLine4,
      city: city ?? this.city,
      homePhone: homePhone ?? this.homePhone,
      mobilePhone: mobilePhone ?? this.mobilePhone,
      businessPhone: businessPhone ?? this.businessPhone,
      customData: customData ?? this.customData,
    );
  }
}
extension CardHolderCopyWith on CreateCardHolderRequest {
  CreateCardHolderRequest copyWithFromControllers(
    Map<String, TextEditingController> controllers,
    List<Map<String, TextEditingController>> dynamicFields,
  ) {
    // Hàm parse dữ liệu từ String sang int hoặc giữ nguyên String
    int? parseInt(String value) => value.isNotEmpty ? int.tryParse(value) : null;
    DateTime? parseDate(String value) =>
        value.isNotEmpty ? DateTime.tryParse(value) : null;

    // Xử lý danh sách customData từ dynamicFields
    List<SetCustomDataInObjectJson> parseCustomData() {
      return dynamicFields
          .where((field) =>
              field['tagName']!.text.trim().isNotEmpty &&
              field['tagValue']!.text.trim().isNotEmpty)
          .map((field) => SetCustomDataInObjectJson(
                tagName: field['tagName']!.text.trim(),
                tagValue: field['tagValue']!.text.trim(), addInfoType: '',
              ))
          .toList();
    }

    return copyWith(
      reason: controllers['reason']?.text.trim(),
      institutionCode: parseInt(controllers['institutionCode']?.text ?? ''),
      branch: parseInt(controllers['branch']?.text ?? ''),
      clientTypeCode: controllers['clientTypeCode']?.text.trim(),
      clientCategory: controllers['clientCategory']?.text.trim(),
      serviceGroup: controllers['serviceGroup']?.text.trim(),
      productCategory: controllers['productCategory']?.text.trim(),
      languageCode: controllers['languageCode']?.text.trim(),
      salutationSuffix: controllers['salutationSuffix']?.text.trim(),
      shortName: controllers['shortName']?.text.trim(),
      firstName: controllers['firstName']?.text.trim(),
      lastName: controllers['lastName']?.text.trim(),
      middleName: controllers['middleName']?.text.trim(),
      maritalStatusCode: controllers['maritalStatusCode']?.text.trim(),
      socialSecurityNumber:
          parseInt(controllers['socialSecurityNumber']?.text ?? ''),
      salutationCode: controllers['salutationCode']?.text.trim(),
      birthDate: parseDate(controllers['birthDate']?.text ?? ''),
      gender: controllers['gender']?.text.trim(),
      birthPlace: controllers['birthPlace']?.text.trim(),
      birthName: controllers['birthName']?.text.trim(),
      citizenship: controllers['citizenship']?.text.trim(),
      taxBracket: controllers['taxBracket']?.text.trim(),
      individualTaxpayerNumber:
          parseInt(controllers['individualTaxpayerNumber']?.text ?? ''),
      secretPhrase: controllers['secretPhrase']?.text.trim(),
      companyName: controllers['companyName']?.text.trim(),
      trademark: controllers['trademark']?.text.trim(),
      department: controllers['department']?.text.trim(),
      embossedTitleCode: controllers['embossedTitleCode']?.text.trim(),
      embossedFirstName: controllers['embossedFirstName']?.text.trim(),
      embossedLastName: controllers['embossedLastName']?.text.trim(),
      embossedCompanyName: controllers['embossedCompanyName']?.text.trim(),
      identityCardType: controllers['identityCardType']?.text.trim(),
      identityCardNumber:
          parseInt(controllers['identityCardNumber']?.text ?? ''),
      identityCardDetails: controllers['identityCardDetails']?.text.trim(),
      clientNumber: parseInt(controllers['clientNumber']?.text ?? ''),
      profession: controllers['profession']?.text.trim(),
      eMail: controllers['eMail']?.text.trim(),
      addressLine1: controllers['addressLine1']?.text.trim(),
      addressLine2: controllers['addressLine2']?.text.trim(),
      addressLine3: controllers['addressLine3']?.text.trim(),
      addressLine4: controllers['addressLine4']?.text.trim(),
      city: controllers['city']?.text.trim(),
      homePhone: controllers['homePhone']?.text.trim(),
      mobilePhone: controllers['mobilePhone']?.text.trim(),
      businessPhone: controllers['businessPhone']?.text.trim(),
      customData: parseCustomData(),
    );
  }
}
extension CardHolderExtensions on CreateCardHolderRequest {
  String getValueByField(String fieldName) {
    switch (fieldName) {
      case 'reason':
        return reason;
      case 'institutionCode':
        return institutionCode.toString();
      case 'branch':
        return branch.toString();
      case 'clientTypeCode':
        return clientTypeCode;
      case 'clientCategory':
        return clientCategory;
      case 'serviceGroup':
        return serviceGroup;
      case 'productCategory':
        return productCategory;
      case 'languageCode':
        return languageCode;
      case 'salutationSuffix':
        return salutationSuffix;
      case 'shortName':
        return shortName;
      case 'firstName':
        return firstName;
      case 'lastName':
        return lastName;
      case 'middleName':
        return middleName;
      case 'maritalStatusCode':
        return maritalStatusCode;
      case 'socialSecurityNumber':
        return socialSecurityNumber.toString();
      case 'salutationCode':
        return salutationCode;
      case 'birthDate':
        return formatDateOnly(birthDate); // Định dạng ngày
      case 'gender':
        return gender;
      case 'birthPlace':
        return birthPlace;
      case 'birthName':
        return birthName;
      case 'citizenship':
        return citizenship;
      case 'taxBracket':
        return taxBracket;
      case 'individualTaxpayerNumber':
        return individualTaxpayerNumber.toString();
      case 'secretPhrase':
        return secretPhrase;
      case 'companyName':
        return companyName;
      case 'trademark':
        return trademark;
      case 'department':
        return department;
      case 'embossedTitleCode':
        return embossedTitleCode;
      case 'embossedFirstName':
        return embossedFirstName;
      case 'embossedLastName':
        return embossedLastName;
      case 'embossedCompanyName':
        return embossedCompanyName;
      case 'identityCardType':
        return identityCardType;
      case 'identityCardNumber':
        return identityCardNumber.toString();
      case 'identityCardDetails':
        return identityCardDetails;
      case 'clientNumber':
        return clientNumber.toString();
      case 'profession':
        return profession;
      case 'eMail':
        return eMail;
      case 'addressLine1':
        return addressLine1;
      case 'addressLine2':
        return addressLine2;
      case 'addressLine3':
        return addressLine3;
      case 'addressLine4':
        return addressLine4;
      case 'city':
        return city;
      case 'homePhone':
        return homePhone;
      case 'mobilePhone':
        return mobilePhone;
      case 'businessPhone':
        return businessPhone;
      // Nếu muốn xử lý customData thì viết thêm ở đây
      default:
        return ''; // Trả về rỗng nếu không khớp
    }
  }
}



List<CreateCardHolderRequest> demoCardHoldersList = [
  CreateCardHolderRequest(
    reason: 'New Account Opening',
    institutionCode: "1001",
    branch: "2001",
    clientTypeCode: 'IND',
    clientCategory: 'VIP',
    serviceGroup: 'Personal',
    productCategory: 'Savings',
    languageCode: 'EN',
    salutationSuffix: 'Mr.',
    shortName: 'JohnD',
    firstName: 'John',
    lastName: 'Doe',
    middleName: 'A.',
    maritalStatusCode: 'S',
    socialSecurityNumber: "123456789",
    salutationCode: '001',
    birthDate: DateTime(1990, 5, 20),
    gender: 'M',
    birthPlace: 'New York',
    birthName: 'Doe',
    citizenship: 'USA',
    taxBracket: 'A',
    individualTaxpayerNumber: "123456789012",
    secretPhrase: 'My first pet name',
    companyName: 'Doe Inc.',
    trademark: 'Doe Trademark',
    department: 'IT',
    embossedTitleCode: '001',
    embossedFirstName: 'John',
    embossedLastName: 'Doe',
    embossedCompanyName: 'Doe Inc.',
    identityCardType: 'Passport',
    identityCardNumber: "987654321012",
    identityCardDetails: 'Issued in NY',
    clientNumber: "5001",
    profession: 'Software Engineer',
    eMail: 'john.doe@example.com',
    addressLine1: '123 Main St',
    addressLine2: 'Apt 4B',
    addressLine3: '',
    addressLine4: '',
    city: 'New York',
    homePhone: '0123456789',
    mobilePhone: '0987654321',
    businessPhone: '0112233445',
    customData: [
      SetCustomDataInObjectJson(addInfoType: 'Type1', tagName: 'Tag1', tagValue: 'Value1'),
      SetCustomDataInObjectJson(addInfoType: 'Type2', tagName: 'Tag2', tagValue: 'Value2'),
    ],
  ),
  CreateCardHolderRequest(
    reason: 'Upgrade Account',
    institutionCode: "1002",
    branch: "2002",
    clientTypeCode: 'CORP',
    clientCategory: 'Regular',
    serviceGroup: 'Business',
    productCategory: 'Checking',
    languageCode: 'EN',
    salutationSuffix: 'Ms.',
    shortName: 'JaneS',
    firstName: 'Jane',
    lastName: 'Smith',
    middleName: 'B.',
    maritalStatusCode: 'M',
    socialSecurityNumber: "987654321",
    salutationCode: '002',
    birthDate: DateTime(1985, 10, 15),
    gender: 'F',
    birthPlace: 'California',
    birthName: 'Smith',
    citizenship: 'USA',
    taxBracket: 'B',
    individualTaxpayerNumber: "987654321012",
    secretPhrase: 'Favorite book name',
    companyName: 'Smith LLC',
    trademark: 'Smith Trademark',
    department: 'Finance',
    embossedTitleCode: '002',
    embossedFirstName: 'Jane',
    embossedLastName: 'Smith',
    embossedCompanyName: 'Smith LLC',
    identityCardType: 'Driver License',
    identityCardNumber: "123123123123",
    identityCardDetails: 'Issued in CA',
    clientNumber: "5002",
    profession: 'Accountant',
    eMail: 'jane.smith@example.com',
    addressLine1: '456 Elm St',
    addressLine2: 'Suite 5C',
    addressLine3: '',
    addressLine4: '',
    city: 'Los Angeles',
    homePhone: '0223344556',
    mobilePhone: '0667788990',
    businessPhone: '0334455667',
    customData: [
      SetCustomDataInObjectJson(addInfoType: 'Type3', tagName: 'Tag3', tagValue: 'Value3'),
    ],
  ),

  
];

