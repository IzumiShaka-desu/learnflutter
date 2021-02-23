import 'package:flutter/material.dart';

import 'image_container_network.dart';

class PhotoProfileImage extends StatelessWidget {
  final String imageUrl;

  const PhotoProfileImage({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: imageUrl != null
          ? ImageContainerNetwork(imageUrl: imageUrl)
          : Icon(Icons.person),
    );
  }
}
