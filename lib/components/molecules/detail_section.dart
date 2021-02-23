import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/text_subtitle_widget.dart';
import 'package:learflutter/components/atoms/title_text_widget.dart';
import 'package:learflutter/components/molecules/readmore_text.dart';
import 'package:learflutter/utils/get_time.dart';

class DetailSection extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;
  final String uploader;

  const DetailSection({Key key, this.title, this.description, this.date, this.uploader}) : super(key: key);

  get time => date.getTimeString();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleTextWidget(text: title??""),
          SizedBox(height: 10),
          TextSubtitleWidget(text: "uploaded by : ${uploader??""} • ${time??""}"),
          SizedBox(height: 10),
          ReadMoreText(
              text: description??"",
              expandText: 'show more',
              closeText: 'show less'),
        ],
      ),
    );
  }
}
