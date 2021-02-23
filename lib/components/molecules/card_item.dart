import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/content_title_text_widget.dart';
import 'package:learflutter/components/atoms/date_text.dart';
import 'package:learflutter/components/atoms/icon_button_normal.dart';
import 'package:learflutter/components/atoms/image_container_network.dart';
import 'package:learflutter/components/atoms/text_content_widget.dart';

class CardItem extends StatefulWidget {
  final String titleText;
  final String imageUrl;
  final String dateText;
  final String descriptionText;
  final Widget footer;
  const CardItem(
      {Key key,
      @required this.titleText,
      this.imageUrl,
      this.descriptionText = "",
      this.dateText = "",
      this.footer})
      : super(key: key);
  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.elasticInOut,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ContentTitleTextWidget(
                        text: widget.titleText,
                      ),
                    ),
                    IconButtonNormal(
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: isExpanded
                        
                            ? Icon(Icons.expand_less,key: UniqueKey(),)
                            : Icon(Icons.expand_more,key: UniqueKey(),),
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    )
                  ],
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: isExpanded
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageContainerNetwork(imageUrl: widget.imageUrl),
                          Row(
                            children: [
                              DateTextWidget(
                                text: widget.dateText,
                              ),
                            ],
                          ),
                          TextContentWidget(text: widget.descriptionText),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: widget.footer ?? SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
