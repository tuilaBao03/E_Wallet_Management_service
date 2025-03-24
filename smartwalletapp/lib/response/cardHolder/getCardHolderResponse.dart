import 'package:smartwalletapp/response/contract/get_contract_response.dart';

class GetCardHolderResponse {
  final int id;
  final String branch;
  final String shortName;
  final String firstName;
  final String lastName;
  final String gender;
  final String clientNumber;
  final String regNumber;
  final String itn;
  final String socialNumber;
  final String phone;
  final String email;
  // Constructor chính
  GetCardHolderResponse({
    required this.id,
    required this.branch,
    required this.shortName,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.clientNumber,
    required this.regNumber,
    required this.itn,
    required this.socialNumber,
    required this.phone,
    required this.email,
  });

  // Named constructor để parse từ JSON
  factory GetCardHolderResponse.fromJson(Map<String, dynamic> json) {
    return GetCardHolderResponse(
      id: json['ID'] ?? 0,
      branch: json['BRANCH'] ?? '',
      shortName: json['SHORT_NAME'] ?? '',
      firstName: json['FIRST_NAM'] ?? '',
      lastName: json['LAST_NAM'] ?? '',
      gender: json['GENDER'] ?? '',
      clientNumber: json['CLIENT_NUMBER'] ?? '',
      regNumber: json['REG_NUMBER'] ?? '',
      itn: json['ITN'] ?? '',
      socialNumber: json['SOCIAL_NUMBER'] ?? '',
      phone: json['PHONE'] ?? '',
      email: json['E_MAIL'] ?? '',
    );
  }

  // Chuyển object về JSON
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'BRANCH': branch,
      'SHORT_NAME': shortName,
      'FIRST_NAM': firstName,
      'LAST_NAM': lastName,
      'GENDER': gender,
      'CLIENT_NUMBER': clientNumber,
      'REG_NUMBER': regNumber,
      'ITN': itn,
      'SOCIAL_NUMBER': socialNumber,
      'PHONE': phone,
      'E_MAIL': email,
    };
  }


  }

  GetCardHolderResponse emptyCardHolder_ReS = GetCardHolderResponse(id: 0, branch: "", shortName: "", firstName: "", lastName: "", gender: "", clientNumber: "", regNumber: "", itn: "", socialNumber: "", phone: "", email: "");


