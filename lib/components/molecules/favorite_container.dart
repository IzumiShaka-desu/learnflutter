import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/image_container_network.dart';
import 'package:learflutter/components/atoms/text_subtitle_widget.dart';

class FavoriteContainer extends StatelessWidget {
  final String imageUrl;

  final String uploader;

  final String titleText;

  const FavoriteContainer(
      {Key key,
      @required this.imageUrl,
      @required this.uploader,
      @required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageContainerNetwork(imageUrl: imageUrl),
          TextSubtitleWidget(text: 'uploaded by $uploader'),
          TextSubtitleWidget(text: titleText),
        ],
      ),
    );
  }
}
