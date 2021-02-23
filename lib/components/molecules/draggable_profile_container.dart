import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/image_container_network.dart';
import 'package:learflutter/constant/color_pallete.dart';
import 'package:learflutter/constant/dummies.dart';

class DraggableProfileContainer extends StatelessWidget {
  final List<Widget> children;
  const DraggableProfileContainer({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      builder: (context, scrollController) {
        return AspectRatio(
          aspectRatio: 9 / 15,
          child: Stack(
            children: [
              Positioned.fill(
                top: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorPallete.backgroundLight,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 55,
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          controller: scrollController,
                          children: children ?? [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Container(
                          height: size.width * 0.30,
                          width: size.width * 0.30,
                          child:
                              ImageContainerNetwork(imageUrl: Dummies.imageUrl),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorPallete.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
