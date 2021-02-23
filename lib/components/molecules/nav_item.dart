import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/icon_normal.dart';

class NavMenu extends StatelessWidget {
  final String name;
  final IconData iconData;
  final Color color;

  const NavMenu(
      {Key key,
      @required this.name,
      @required this.iconData,
      @required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: txtTheme.subtitle2.copyWith(
              color: color,
            ),
          ),
          IconNormal(
            icon: iconData,
            color: color,
          )
        ],
      ),
    );
  }
}
