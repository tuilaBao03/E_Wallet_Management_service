
class User {
  final String username;
  final String password;
  final String phoneNumber;
  final String homeAddress;
  final String companyAddress;
  final String lastName;
  final String firstName;
  final String avatar;

  User({
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.homeAddress,
    required this.companyAddress,
    required this.lastName,
    required this.firstName,
    required this.avatar,
  });

  /// **Chuyển từ JSON sang `User` object**
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      homeAddress: json['homeAddress'],
      companyAddress: json['companyAddress'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      avatar: json['avatar'],
    );
  }

  /// **Chuyển từ `User` object sang JSON**
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'phoneNumber': phoneNumber,
      'homeAddress': homeAddress,
      'companyAddress': companyAddress,
      'lastName': lastName,
      'firstName': firstName,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return 'User(username: $username, firstName: $firstName, lastName: $lastName)';
  }
}