import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/default_snackbar.dart';
import 'package:learflutter/components/atoms/video_container.dart';
import 'package:learflutter/components/molecules/detail_section.dart';
import 'package:learflutter/constant/color_pallete.dart';
import 'package:learflutter/data/models/video.dart';
import 'package:learflutter/ui/viewmodels/main_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailVideo extends StatelessWidget {
  final Video video;

  const DetailVideo({Key key,@required this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VideoContainer(
            videoId: video.contentDetails.videoId,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DetailSection(
                description: video.snippet.description,
                uploader: video.snippet.channelTitle,
                date: video.contentDetails.videoPublishedAt,
                title: video.snippet.title,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Consumer<MainViewmodel>(
        builder: (context, provider, _) => FloatingActionButton(
          onPressed: () async {
            await provider.updateFavorite(
                context, video.contentDetails.videoId);
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 350),
            child: provider.isFavoriteVideo(video.contentDetails.videoId)
                ? Icon(
                    Icons.favorite,
                    color: ColorPallete.altPink,
                    key: UniqueKey(),
                  )
                : Icon(
                    Icons.favorite_border,
                    color: ColorPallete.altPink,
                    key: UniqueKey(),
                  ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  showSnackbar(String _msg) => ScaffoldMessengerState().showSnackBar(
        createSnackbar(_msg),
      );
}
