

import 'package:flutter/cupertino.dart';
import 'package:scp/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'as convert;
class UserService{


  //final String urlget = "https://next.json-generator.com/api/json/get/EkLrmfeyF";

  String urlpost="";
  String urlget = "";

  bool isLogin = false;
  String message;
  String token;
  bool isRegister = false;
  User user;


  Future<User> registerUser({String username, String password,String organization}) async{
    User user = await createUser(username: username, password: password, organization: organization);
    if (user != null) {
      isRegister = true;
      message = " SignUp : Success!! ";
    }
    else {
      message = " SignUp : Error ";
      isRegister=false;
    }
    return await signInUser(username: user.username,password: user.password, organization: user.organization);
  }

  void logOut(){
    isLogin=false;
  }

  //
  Future<User> signInUser({@required String username, @required String password, @required String organization}) async {
    User user = await getUser(username: username, password: password,organization : organization);
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

  // create a user
  Future<User> createUser({@required String username,@required String password, @required String organization}) async{
    urlpost = "localhost:3000/RegisterUser/$username-$password-$organization";
    final response = await http.post(urlpost);

    if(response.statusCode == 201){
      final String responseString = response.body;
      return userFromJson(responseString);
    }else{
      return null;
    }
  }

  Future<User> getUser({String username, String password, String organization}) async{
    User user;
    urlget ="localhost:3000/SignInUser/$username-$password-$organization";
    var response = await http.get(urlget);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var u in jsonResponse){
        if(username == u['Username'] && password == u['Password'] && organization==u["Organization"]) {
          user = User.fromJson(u);
          print(user.username + " " + user.password+" "+user.organization);
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