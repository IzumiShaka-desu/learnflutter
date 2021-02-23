import 'package:flutter/material.dart';
import 'package:learflutter/components/molecules/favorite_container.dart';
import 'package:learflutter/data/models/video.dart';
import 'package:learflutter/ui/view/detail_video/detail_video.dart';
import 'package:learflutter/utils/navigation.dart';

class FavoriteList extends StatelessWidget {
  final List<Video> favoriteVideos;

  const FavoriteList({Key key, this.favoriteVideos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (favoriteVideos ?? []).length < 1
          ? Center(
              child: Text('You have\'nt any favorite video'),
            )
          : ListView.builder(
              itemCount: favoriteVideos.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => goTo(
                  context,
                  DetailVideo(
                    video: favoriteVideos[index],
                  ),
                ),
                child: Card(
                  child: FavoriteContainer(
                    imageUrl: favoriteVideos[index]
                        .snippet
                        .thumbnails
                        .thumbnailsDefault
                        .url,
                    titleText: favoriteVideos[index].snippet.title,
                    uploader: favoriteVideos[index].snippet.channelTitle,
                  ),
                ),
              ),
            ),
    );
  }
}
