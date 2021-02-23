import 'package:flutter/material.dart';

class ImageContainerNetwork extends StatelessWidget {
  final String imageUrl;
  final placeholder =
      "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/loadinganimation.gif";
  const ImageContainerNetwork({Key key, @required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty && imageUrl != null && imageUrl != 'null'
        ? FadeInImage(
            placeholder: NetworkImage(placeholder),
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            imageSemanticLabel: 'video thumbnail',
          )
        : Tooltip(
            message: 'cannot load image',
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "broken image",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 8),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.broken_image_outlined,
                    size: 50,
                  ),
                ],
              ),
            ),
          );
  }
}
