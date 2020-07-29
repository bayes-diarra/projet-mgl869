import 'package:MedChain/model/User.dart';
import 'package:flutter/material.dart';

import '../deliver/components/../../common/background.dart';

class Body extends StatelessWidget {
  final User user;
  const Body({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hi " + user.username == null ? "" : user.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
