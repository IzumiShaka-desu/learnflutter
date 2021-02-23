
import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/text_content_widget.dart';
import 'package:learflutter/components/atoms/title_text_widget.dart';

class DefaultAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;

  const DefaultAlertDialog({
    Key key,
    this.title,
    @required this.message,
    this.actions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TitleTextWidget(text: title),
      content: TextContentWidget(text: message),
      actions: actions ?? [],
    );
  }
}
