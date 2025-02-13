// ignore_for_file: non_constant_identifier_names

class CardHolder {
  final String phoneNumber;
  final String homeAddress;
  final String companyAddress;
  final String lastName;
  final String firstName;
  final String avatar;
  final String email;
  final String cardHolderId;
  final DateTime createdDate;
  final DateTime updateDate;
  final bool status;

  CardHolder({
    required this.cardHolderId,
    required this.phoneNumber,
    required this.homeAddress,
    required this.companyAddress,
    required this.lastName,
    required this.firstName,
    required this.avatar,
    required this.email,
    required this.createdDate,
    required this.updateDate,
    required this.status,
  });

  /// **Chuyển từ JSON sang `User` object**
  factory CardHolder.fromJson(Map<String, dynamic> json) {
    return CardHolder(
      cardHolderId: json["cardHolderId"],
      phoneNumber: json['phoneNumber'],
      homeAddress: json['homeAddress'],
      companyAddress: json['companyAddress'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      avatar: json['avatar'],
      email: json['email'],
      createdDate: DateTime.parse(json['createdDate']),
      updateDate: DateTime.parse(json['updateDate']),
      status: json['status'],
    );
  }

  /// **Chuyển từ `User` object sang JSON**
  Map<String, dynamic> toJson() {
    return {
      'cardHolderId': cardHolderId,
      'phoneNumber': phoneNumber,
      'homeAddress': homeAddress,
      'companyAddress': companyAddress,
      'lastName': lastName,
      'firstName': firstName,
      'avatar': avatar,
      'email': email,
      'createdDate': createdDate.toIso8601String(),
      'updateDate': updateDate.toIso8601String(),
      'status': status,
    };
  }

  @override
  String toString() {
    return "CardHolder( firstName: $firstName, lastName: $lastName, email: $email)";
  }
}

/// **Danh sách người dùng mẫu**
List<CardHolder> demoCardHoldersList = [
  CardHolder(
    cardHolderId: '1',
    phoneNumber: '123-456-7890',
    homeAddress: '123 Main St',
    companyAddress: '456 Business Blvd',
    lastName: 'Doe',
    firstName: 'John',
    avatar: 'assets/images/profile_pic.png',
    email: 'john.doe@example.com',
    createdDate: DateTime(2023, 5, 1),
    updateDate: DateTime(2024, 1, 1),
    status: true,
  ),
  CardHolder(
    cardHolderId: '2',
    phoneNumber: '987-654-3210',
    homeAddress: '789 Elm St',
    companyAddress: '101 Corporate Rd',
    lastName: 'Smith',
    firstName: 'Jane',
    avatar: 'assets/images/profile_pic.png',
    email: 'jane.smith@example.com',
    createdDate: DateTime(2022, 8, 15),
    updateDate: DateTime(2024, 2, 5),
    status: true,
  ),
  CardHolder(
    cardHolderId: '3',
    phoneNumber: '555-666-7777',
    homeAddress: '456 Oak Ave',
    companyAddress: '333 Tech Park',
    lastName: 'Brown',
    firstName: 'Robert',
    avatar: 'assets/images/profile_pic.png',
    email: 'robert.brown@example.com',
    createdDate: DateTime(2021, 12, 20),
    updateDate: DateTime(2024, 1, 20),
    status: false,
  ),
];
