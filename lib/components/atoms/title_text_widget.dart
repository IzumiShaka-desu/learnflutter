
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;

  const TitleTextWidget({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4.copyWith(
          fontWeight: FontWeight.w600,
              color: ColorPallete.backgroundDark,
            ),
      ),
    );
  }
}
