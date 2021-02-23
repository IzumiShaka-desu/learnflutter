import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;
  const PrimaryButton({
    Key key,
    this.text = "",
    @required this.onPressed,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      onPressed: onPressed ?? () {},
      style: TextButton.styleFrom(
        backgroundColor: ColorPallete.primaryLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,5),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: ColorPallete.backgroundLight,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
