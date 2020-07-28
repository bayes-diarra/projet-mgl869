import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/screens/deliver/deliverHome.dart';
import 'package:MedChain/screens/healthworker/healthworkerHome.dart';
import 'package:MedChain/screens/login/login_screen.dart';
import 'package:MedChain/components/already_have_an_account_acheck.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/components/rounded_input_field.dart';
import 'package:MedChain/components/rounded_password_field.dart';
import 'package:MedChain/screens/manufacturer/manufacturerHome.dart';
import 'package:MedChain/screens/patient/patientHome.dart';
import 'package:MedChain/screens/wholesaler/wholesalerHome.dart';
import 'package:MedChain/services/UserService.dart';
import 'package:MedChain/utility/constants.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserService _service = new UserService();
  bool _obscurText = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final TextEditingController organizationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    password1Controller.dispose();
    password2Controller.dispose();
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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              controller: usernameController,
              hintText: "Username",
              icon: Icons.person,
            ),
            RoundedPasswordField(
              controller: password1Controller,
              hintText: "Password",
              obscureText: _obscurText,
              suffixeIcon: IconButton(
                onPressed: () {
                  if (_obscurText == true) {
                    setState(() {
                      _obscurText = false;
                    });
                  } else
                    setState(() {
                      _obscurText = true;
                    });
                },
                icon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
              ),
            ),
            RoundedPasswordField(
              controller: password2Controller,
              hintText: "Password",
              obscureText: _obscurText,
              suffixeIcon: IconButton(
                onPressed: () {
                  if (_obscurText == true) {
                    setState(() {
                      _obscurText = false;
                    });
                  } else
                    setState(() {
                      _obscurText = true;
                    });
                },
                icon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
              ),
            ),
            RoundedInputField(
              controller: organizationController,
              hintText: "Organization",
            ),
            RoundedButton(
                text: "REGISTER",
                press: () async {
                  final String username = usernameController.text;
                  final String password = password1Controller.text;
                  final String organization = organizationController.text;

                  User user;

                  if (username != null &&
                      password != null &&
                      organization != null &&
                      password1Controller.text == password2Controller.text) {
                    user = await _service.registerUser(
                        username: username,
                        password: password,
                        organization: organization);
                    if (user != null && _service.isLogin) {
                      if (user.organization == "patient") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PatientHome(user: user);
                            },
                          ),
                        );
                      }

                      if (user.organization == "manufacturer") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ManufacturerHome(user: user);
                            },
                          ),
                        );
                      }
                      if (user.organization == "deliver") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DeliverHome(user: user);
                            },
                          ),
                        );
                      }
                      if (user.organization == "wholesaler") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WholesalerHome(user: user);
                            },
                          ),
                        );
                      }
                      if (user.organization == "doctor") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HealthworkerHome(user: user);
                            },
                          ),
                        );
                      }
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${_service.message}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Check the input fields '),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}