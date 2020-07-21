

import 'package:flutter/cupertino.dart';
import 'package:scp/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'as convert;
class UserService{


  final String urlget = "https://next.json-generator.com/api/json/get/EkLrmfeyF";
  final String urlpost="";
  bool isLogin = false;
  String message;
  String token;
  bool isRegister = false;
  User user;


  Future<User> registerUser({String username, String password,String role}) async{
    User user = await addUser(username: username, password: password, role: role);
    if (user != null) {
      isRegister = true;
      message = " SignUp : Success!! ";
    }
    else {
      message = " SignUp : Error ";
      isRegister=false;
    }
    return await authenticateUser(username: user.username,password: user.password);;
  }

  void logOut(){
    isLogin=false;
  }


  Future<User> authenticateUser({@required String username, @required String password}) async {
    User user = await getUser(username: username, password: password);

    if(user !=null ){
      isLogin =true;
      message =" SignIn : Success!! ";
    }
    else {
      isLogin=false;
      message = " SignIn : Error ";
    }

    return user;
  }

  Future<List<User>> getAllUsers() async{
    List<User> users = [];
    var response = await http.get(urlget);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var u in jsonResponse){
        User user = User.fromJson(u);
        users.add(user);
      }
      int x = users.length;
      print('Number of users about http: $x');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return users;
  }

  Future<User> addUser({@required String username,@required String password, @required String role}) async{

    final response = await http.post(urlpost, body: {
      "username": username,
      "password": password,
      "role": role,
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return userFromJson(responseString);
    }else{
      return null;
    }
  }

  Future<User> getUser({String username, String password}) async{
    User user;
    var response = await http.get(urlget);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var u in jsonResponse){
        if(username == u['username'] && password == u['password']) {
          user = User.fromJson(u);
          print(user.username + " " + user.password);
          break;
        }
      }

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    await Future.delayed(Duration(seconds: 1));
    return user;
  }

}