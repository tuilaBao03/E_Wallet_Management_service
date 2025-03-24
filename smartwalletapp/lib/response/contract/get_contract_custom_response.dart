class GetCardHolderResponseCustom {
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

  GetCardHolderResponseCustom({
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

  /// Chuyển từ JSON sang Object
  factory GetCardHolderResponseCustom.fromJson(Map<String, dynamic> json) {
    return GetCardHolderResponseCustom(
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

}
