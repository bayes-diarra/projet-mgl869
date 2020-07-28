import 'package:MedChain/components/general_functions.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/screens/common/get_product.dart';
import 'package:MedChain/screens/wholesaler/available_deliveries.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final User user;
  final String usrname;
  final String orga;
  const NavDrawer({Key key, this.user, this.orga, this.usrname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(usrname == null ? "" : usrname),
            accountEmail: Text(orga == null ? "" : orga),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellow[700],
                child: Text(usrname == null ? "" : usrname.substring(0))),
          ),
          ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text('Accept Delivery'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AvailableDeliveries(
                  key: key,
                  user: user,
                  page: "AcceptDelivery",
                );
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.send),
            title: Text('Send Delivery'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AvailableDeliveries(
                    key: key, user: user, page: "SendDelivery");
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Get product'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GetProduct(key: key, user: user);
              }));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.directions),
            onTap: () {
              GeneralFuntions.showMyDialog(
                context: context,
                title: Text("Log out"),
                text: Text("Do you really want to log out?"),
                okPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
