
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class TextSubtitleWidget extends StatelessWidget {
  final String text;
  final bool isDark;
  const TextSubtitleWidget({Key key, this.text, this.isDark=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2.copyWith(
              color:isDark? ColorPallete.backgroundLight:ColorPallete.backgroundDark,
              fontWeight: FontWeight.w500
            ),
      ),
    );
  }
}
