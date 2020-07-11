import 'dart:convert';



User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userId,
    this.username,
    this.password,
    this.role,
  });

  String userId;
  String username;
  String password;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    username: json["username"],
    password: json["password"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "password": password,
    "role": role,
  };


}




