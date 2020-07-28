import 'package:MedChain/screens/wholesaler/components/nav_drawer.dart';
import 'package:MedChain/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:MedChain/model/User.dart';

class WholesalerHome extends StatefulWidget {
  final User user;
  WholesalerHome({Key key, this.user}) : super(key: key);
  @override
  _WholesalerHomeState createState() => _WholesalerHomeState();
}

class _WholesalerHomeState extends State<WholesalerHome> {
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
          title: Text('Wholesaler'),
        ),
        body: Center(child: Text("Wholesaler Home")),
        drawer: NavDrawer(
          key: widget.key,
          user: widget.user,
          orga: organization,
          usrname: username,
        ));
  }
}
