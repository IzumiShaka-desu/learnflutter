import 'package:flutter/material.dart';
import 'package:learflutter/components/organisms/timeline_container.dart';
import 'package:learflutter/ui/viewmodels/main_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewmodel>(
      builder: (BuildContext context, provider, _) {
        var videos = provider.videos;
        if (videos == null) {
          provider.loadVideos();
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: TimelineContainer(
              item: videos,
            ),
          );
        }
      },
    );
  }
}
