import 'package:MedChain/components/general_functions.dart';
import 'package:MedChain/model/User.dart';
import 'package:MedChain/screens/common/get_product.dart';
import 'package:MedChain/screens/common/send_delivery_request.dart';
import 'package:MedChain/screens/manufacturer/add_product.dart';
import 'package:MedChain/screens/manufacturer/components/available_deliveries.dart';
import 'package:MedChain/screens/scan/components/generate.dart';
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
            leading: Icon(Icons.add),
            title: Text('Add Prduct'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddProduct(user: user);
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.send),
            title: Text('Send Delivery Request'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SendDeliveryRequest(key: key, user: user);
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dehaze),
            title: Text('Send Deliverie'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AvailableDeliveries(
                  key: key,
                  user: user,
                );
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
            leading: Icon(Icons.select_all),
            title: Text('Generate QR code'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GeneratePage();
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