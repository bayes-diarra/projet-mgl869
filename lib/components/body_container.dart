import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  final Size size;
  const BodyContainer({
    Key key,
    this.size,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: size == null ? null : size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[child],
        ));
  }
}
