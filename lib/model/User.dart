import 'dart:convert';



User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    //this.userId,
    this.username,
    this.password,
    this.organization,
  });

  //String userId;
  String username;
  String password;
  String organization;

  factory User.fromJson(Map<String, dynamic> json) => User(
    //userId: json["userId"],
    username: json["Username"],
    password: json["Password"],
    organization: json["Organization"],
  );

  Map<String, dynamic> toJson() => {
    //"userId": userId,
    "username": username,
    "password": password,
    "role": organization,
  };


}




