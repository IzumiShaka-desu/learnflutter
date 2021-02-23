
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class IconButtonWarning extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const IconButtonWarning({Key key, @required this.icon, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: IconButton(
        icon: icon,
        iconSize: 35,
        color: ColorPallete.altRed,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
