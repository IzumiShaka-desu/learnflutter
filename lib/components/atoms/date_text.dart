import 'package:flutter/material.dart';

class DateTextWidget extends StatelessWidget {
  final String text;

  const DateTextWidget({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500
            ),
      ),
    );
  }
}
