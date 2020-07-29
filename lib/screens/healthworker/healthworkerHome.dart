import 'package:MedChain/screens/common/body.dart';
import 'package:MedChain/screens/healthworker/components/nav_drawer.dart';
import 'package:MedChain/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/model/User.dart';

class HealthworkerHome extends StatefulWidget {
  final User user;
  HealthworkerHome({Key key, this.user}) : super(key: key);
  @override
  _HealthworkerHomeState createState() => _HealthworkerHomeState();
}

class _HealthworkerHomeState extends State<HealthworkerHome> {
  String username = "";
  String organization = "";

  @override
  void initState() {
    username = widget.user == null ? "" : widget.user.username;
    organization = widget.user == null ? "" : widget.user.organization;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Healthworker'),
        ),
        body: Center(
            child: Body(
          user: widget.user,
        )),
        drawer: NavDrawer(
          key: widget.key,
          user: widget.user,
          orga: organization,
          usrname: username,
        ));
  }
}
