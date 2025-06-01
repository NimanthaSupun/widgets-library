
class UserModel {
  final String userId;
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
  });
  // convert to dart
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId":userId,
      "name":name,
      "email":email,
      "password":password,
    };
  }
}
