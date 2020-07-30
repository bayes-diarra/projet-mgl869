import 'package:MedChain/model/Role.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:MedChain/components/rounded_password_field.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/screens/deliver/deliverHome.dart';
import 'package:MedChain/screens/healthworker/healthworkerHome.dart';
import 'package:MedChain/screens/manufacturer/manufacturerHome.dart';
import 'package:MedChain/screens/patient/patientHome.dart';
import 'package:MedChain/screens/signup/signup_screen.dart';
import 'package:MedChain/components/already_have_an_account_acheck.dart';
import 'package:MedChain/components/rounded_button.dart';
import 'package:MedChain/components/rounded_input_field.dart';
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
  final TextEditingController passwordController = TextEditingController();

  List<Role> roles = Role.getRoles();
  List<DropdownMenuItem<Role>> dropdownMenuItems;
  Role selectedRole;

  @override
  void initState() {
    dropdownMenuItems = buildDropdownMenuItems(roles);
    selectedRole = dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Role>> buildDropdownMenuItems(List roles) {
    List<DropdownMenuItem<Role>> items = List();
    for (Role role in roles) {
      items.add(
        DropdownMenuItem(
          value: role,
          child: Text(role.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Role _selectedRole) {
    setState(() {
      selectedRole = _selectedRole;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
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
                  _obscurText == true ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                ),
              ),
            ),
            DropdownButton(
              value: selectedRole,
              items: dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                final String username = usernameController.text;
                final String password = passwordController.text;
                final String organization = selectedRole.value;

                if (usernameController.text != null &&
                    passwordController.text != null &&
                    organization != null) {
                  final User user = await _service.signInUser(
                      username: username,
                      password: password,
                      organization: organization);
                  if (user != null && _service.isLogin == true) {
                    if (user.organization == "Org4MSP") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PatientHome(user: user);
                          },
                        ),
                      );
                    }

                    if (user.organization == "Org1MSP") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ManufacturerHome(user: user);
                          },
                        ),
                      );
                    }
                    if (user.organization == "Org2MSP") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DeliverHome(user: user);
                          },
                        ),
                      );
                    }
                    if (user.organization == "Org3MSP") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WholesalerHome(user: user);
                          },
                        ),
                      );
                    }
                    if (user.organization == "Org5MSP") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HealthworkerHome(user: user);
                          },
                        ),
                      );
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
                }),
          ],
        ),
      ),
    );
  }
}
