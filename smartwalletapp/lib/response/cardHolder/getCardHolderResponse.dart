// ignore_for_file: file_names

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
      id: json['id'] ?? 0,
      branch: json['branch'] ?? '',
      shortName: json['shortName'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      clientNumber: json['clientNumber'] ?? '',
      regNumber: json['regNumber'] ?? '',
      itn: json['itn'] ?? '',
      socialNumber: json['socialNumber'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
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
  @override
  String toString() {
    return 'GetCardHolderResponse(id: $id, branch: $branch, shortName: $shortName, '
           'firstName: $firstName, lastName: $lastName, gender: $gender, '
           'clientNumber: $clientNumber, regNumber: $regNumber, itn: $itn, '
           'socialNumber: $socialNumber, phone: $phone, email: $email)';
  }


  }

  GetCardHolderResponse emptyCardHolder_ReS = GetCardHolderResponse(id: 0, branch: "", shortName: "", firstName: "", lastName: "", gender: "", clientNumber: "1235846656255", regNumber: "", itn: "", socialNumber: "", phone: "", email: "");


