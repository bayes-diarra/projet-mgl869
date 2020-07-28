import 'package:MedChain/screens/deliver/components/nav_drawer.dart';
import 'package:MedChain/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/model/User.dart';

class DeliverHome extends StatefulWidget {
  final User user;
  DeliverHome({Key key, this.user}) : super(key: key);

  @override
  _DeliverHomeState createState() => _DeliverHomeState();
}

class _DeliverHomeState extends State<DeliverHome> {
  String username = "";
  String organization = "";

  @override
  void initState() {
    username = widget.user == null ? "" : widget.user.username;
    organization = widget.user == null ? "" : widget.user.username;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Deliver'),
        ),
        body: Center(child: Text("Deliver Home")),
        drawer: NavDrawer(
          key: widget.key,
          user: widget.user,
          orga: organization,
          usrname: username,
        ));
  }
}
