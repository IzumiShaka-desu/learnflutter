
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class LogoutButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const LogoutButton({
    Key key,
    this.text = "",
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: TextButton.styleFrom(
        backgroundColor: ColorPallete.altRed,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: ColorPallete.backgroundLight,
                ),
          ),
        ],
      ),
    );
  }
}
