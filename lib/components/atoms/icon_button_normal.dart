import 'package:flutter/material.dart';

class IconButtonNormal extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const IconButtonNormal({Key key, @required this.icon, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: 30,
      color: Theme.of(context).primaryColor,
      onPressed: onPressed ?? () {},
    );
  }
}
