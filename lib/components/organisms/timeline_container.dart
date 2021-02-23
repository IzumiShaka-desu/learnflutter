import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:learflutter/components/atoms/primary_button.dart';
import 'package:learflutter/components/molecules/card_item.dart';
import 'package:learflutter/data/models/video.dart';
import 'package:learflutter/ui/view/detail_video/detail_video.dart';
import 'package:learflutter/utils/navigation.dart';
import 'package:learflutter/utils/get_time.dart';

class TimelineContainer extends StatelessWidget {
  const TimelineContainer({
    Key key,
    @required this.item,
  }) : super(key: key);
  final List<Video> item;
  @override
  Widget build(BuildContext context) {
    return (item ?? []).isNotEmpty
        ? Timeline(
            events: List<TimelineEventDisplay>.from(
              item.map(
                (video) => TimelineEventDisplay(
                  indicator: TimelineDots.of(context).borderDot,
                  child: CardItem(
                    titleText: "${video.snippet.title.split("-").last}",
                    imageUrl: '${video.snippet.thumbnails.thumbnailsDefault.url}',
                    dateText:
                        "${video.contentDetails.videoPublishedAt.getTimeString()}",
                    footer: Row(
                      children: [
                        PrimaryButton(
                          onPressed: () {
                            goTo(
                              context,
                              DetailVideo(
                                video: video,
                              ),
                            );
                          },
                          text: '  watch  ',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Center(child: Text('no item on list'));
  }
}
