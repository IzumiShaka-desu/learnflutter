import 'package:flutter/material.dart';

class IconNormal extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconNormal({Key key,@required this.icon,@required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,color: color,
      size: 35,
    );
  }
}