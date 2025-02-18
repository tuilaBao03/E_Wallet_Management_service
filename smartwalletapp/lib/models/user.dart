// ignore_for_file: non_constant_identifier_names

class User {
  final String username;
  final String password;
  final String phoneNumber;
  final String homeAddress;
  final String companyAddress;
  final String lastName;
  final String firstName;
  final String avatar;
  final String email;
  final String userId;
  final DateTime createdDate;
  final DateTime updateDate;
  final bool status;

  User({
    required this.userId,
    required this.username,
    required this.password,
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
    factory User.fromJson(Map<String, dynamic> json) {
      return User(
        userId: json["userId"] ?? '',
        username: json["username"] ?? '',
        password: json["password"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        homeAddress: json["homeAddress"] ?? '',
        companyAddress: json["companyAddress"] ?? '',
        lastName: json["lastName"] ?? '',
        firstName: json["firstName"] ?? '',
        avatar: json["avatar"] ?? 'default-avatar.png',
        email: json["email"] ?? '',
        createdDate: json["createdDate"] != null ? DateTime.parse(json["createdDate"]) : DateTime.now(),
        updateDate: json["updatedDate"] != null ? DateTime.parse(json["updatedDate"]) : DateTime.now(),
        status: json["status"] ?? false,
      );
    }

  /// **Chuyển từ `User` object sang JSON**
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'password': password,
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
    return "User(username: $username, firstName: $firstName, lastName: $lastName, email: $email)";
  }
}

/// **Danh sách người dùng mẫu**
List<User> demoCustomersList = [
  User(
    userId: '1',
    username: 'john_doe',
    password: 'password123',
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
];
