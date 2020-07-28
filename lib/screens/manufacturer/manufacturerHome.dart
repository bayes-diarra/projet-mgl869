import 'package:MedChain/screens/manufacturer/components/nav_drawer.dart';
import 'package:MedChain/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/model/User.dart';

class ManufacturerHome extends StatefulWidget {
  final User user;
  ManufacturerHome({Key key, this.user}) : super(key: key);
  @override
  _ManufacturerHomeState createState() => _ManufacturerHomeState();
}

class _ManufacturerHomeState extends State<ManufacturerHome> {
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
          title: Text('Manufacturer Home'),
        ),
        body: Center(child: Text("Manu Home")),
        drawer: NavDrawer(
          key: widget.key,
          user: widget.user,
          orga: organization,
          usrname: username,
        ));
  }
}
