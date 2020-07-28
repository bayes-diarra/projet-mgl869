import 'package:flutter/material.dart';

class GeneralFuntions {
  static Future<void> showMyDialog(
      {BuildContext context,
      Text title,
      Text text,
      Function okPressed,
      Function cancelPressed}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                text,
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: cancelPressed != null
                  ? cancelPressed
                  : () {
                      Navigator.pop(context);
                    },
            ),
            FlatButton(child: Text('Ok'), onPressed: okPressed),
          ],
        );
      },
    );
  }
}
