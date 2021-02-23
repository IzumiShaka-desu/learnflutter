
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class ContentTitleTextWidget extends StatelessWidget {
  final String text;

  const ContentTitleTextWidget({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        overflow:TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 16,
          
          fontWeight: FontWeight.w600,
              color: ColorPallete.textBlack,
            ),
      ),
    );
  }
}
