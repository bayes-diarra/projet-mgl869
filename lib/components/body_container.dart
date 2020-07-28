import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  const BodyContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[child],
        ));
  }
}
