
import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/text_content_widget.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final String expandText;
  final String closeText;
  const ReadMoreText({
    Key key,
    @required this.text,
    @required this.expandText,
    @required this.closeText,
  }) : super(key: key);
  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            switchInCurve: Curves.bounceIn,
            switchOutCurve: Curves.bounceOut,
            child: isExpanded
                ? TextContentWidget(
                    text:widget.text,
                    key: UniqueKey(),
                  )
                : TextContentWidget(
                   text: widget.text.substring(0, 120) + '....',
                    key: UniqueKey(),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded?widget.closeText: widget.expandText,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.blueAccent),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
