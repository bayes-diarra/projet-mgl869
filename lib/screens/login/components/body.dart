import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:scp/components/rounded_password_field.dart';
import 'package:scp/model/User.dart';
import 'package:scp/screens/deliver/deliverHome.dart';
import 'package:scp/screens/healthworker/healthworkerHome.dart';
import 'package:scp/screens/manufacturer/manufacturerHome.dart';
import 'package:scp/screens/patient/patientHome.dart';
import 'package:scp/screens/signup/signup_screen.dart';
import 'package:scp/components/already_have_an_account_acheck.dart';
import 'package:scp/components/rounded_button.dart';
import 'package:scp/components/rounded_input_field.dart';
import 'package:scp/screens/wholesaler/wholesalerHome.dart';
import 'package:scp/services/UserService.dart';
import 'package:scp/utility/constants.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
UserService _service =  new UserService();
bool _obscurText = true;

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController organizationController = TextEditingController();

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
  usernameController.dispose();
  passwordController.dispose();
  organizationController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: usernameController,
              hintText: "Username",
              icon: Icons.person,
              //onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              hintText: "Password",
              obscureText: _obscurText,
              suffixeIcon: IconButton(
                onPressed: () {
                  if(_obscurText==true){
                    setState(() {
                      _obscurText=false;
                    });
                  }
                  else
                    setState(() {
                      _obscurText=true;
                    });
                },
                icon: Icon(Icons.visibility,
                  color: kPrimaryColor,
                ),),
            ),
            RoundedInputField(
              controller: organizationController,
              hintText: "Organization",
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async{
                final String username = usernameController.text;
                final String password = passwordController.text;
                final String organization = organizationController.text;

                final User user = await _service.signInUser(username: username, password: password , organization: organization);

                if(user != null && _service.isLogin)
                  {
                    if(user.organization == "patient"){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PatientHome(user: user);
                          },
                        ),
                      );
                    }

                    if(user.organization == "manufacturer"){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ManufacturerHome(user: user);
                          },
                        ),
                      );
                    }
                    if(user.organization == "deliver"){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DeliverHome(user: user);
                          },
                        ),
                      );
                    }
                    if(user.organization == "wholesaler"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WholesalerHome(user: user);
                          },
                        ),
                      );
                    }
                    if(user.organization == "doctor"){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HealthworkerHome(user: user);
                          },
                        ),
                      );
                    }
                  }
                else{
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${_service.message}'),
                        backgroundColor: Colors.red,
                        ),
                      );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
