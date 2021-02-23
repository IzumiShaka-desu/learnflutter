
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class TextContentWidget extends StatelessWidget {
  final String text;

  const TextContentWidget({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2.copyWith(
              color: ColorPallete.textBlack,
            ),
      ),
    );
  }
}
