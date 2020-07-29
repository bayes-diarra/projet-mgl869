import 'package:MedChain/utility/links.dart';
import 'package:flutter/cupertino.dart';
import 'package:MedChain/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'dart:io';

class UserService {
  //final String urlget = "https://next.json-generator.com/api/json/get/EkLrmfeyF";

  String urlpost = "";
  String urlget = "";

  bool isLogin = false;
  String message;
  String token;
  bool isRegister = false;
  User user;

  Future<User> registerUser(
      {String username, String password, String organization}) async {
    User user = await createUser(
        username: username, password: password, organization: organization);
    if (user != null) {
      isRegister = true;
      message = " SignUp : Success!! ";
    } else {
      message = " SignUp : Error ";
      isRegister = false;
    }
    sleep(const Duration(seconds: 2));
    return await signInUser(
        username: username, password: password, organization: organization);
  }

  void logOut() {
    isLogin = false;
  }

  //
  Future<User> signInUser(
      {@required String username,
      @required String password,
      @required String organization}) async {
    User user = await getUser(
        username: username, password: password, organization: organization);
    if (user != null) {
      isLogin = true;
      message = " SignIn : Success!! ";
    } else {
      isLogin = false;
      message = " SignIn : Error ";
    }
    return user;
  }

  // create a user
  Future<User> createUser(
      {@required String username,
      @required String password,
      @required String organization}) async {
    urlpost = link + "/RegisterUser/$username-$password-$organization";
    final response = await http.get(urlpost);

    if (response.statusCode == 201) {
      final String responseString = response.body;

      return userFromJson(responseString);
    } else {
      return null;
    }
  }

  Future<User> getUser(
      {String username, String password, String organization}) async {
    User user;
    urlget = link + "/SignInUser/$username-$password-$organization";
    var response = await http.get(urlget);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      debugPrint(jsonResponse['Username']);
      //print(response.body.runtimeType);
      //for (var u in jsonResponse) {
      if (username == jsonResponse['Username'] &&
          password == jsonResponse['Password'] &&
          organization == jsonResponse["Organization"]) {
        user = User.fromJson(jsonResponse);
        print(user.username + " " + user.password + " " + user.organization);
        //break;
        //}
      }
      debugPrint(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    await Future.delayed(Duration(seconds: 1));
    return user;
  }
}
