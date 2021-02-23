import 'package:flutter/material.dart';
import 'package:learflutter/components/organisms/favorite_list.dart';
import 'package:learflutter/ui/viewmodels/main_viewmodel.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MainViewmodel>(builder: (context, provider, _) {
        var _favorites = provider.favorites;
        if (_favorites == null) {
          provider.loadFavorite();
          if (provider.videos == null) {
            provider.loadVideos();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var favoriteVideos = provider.getFavoriteVideos();
        return FavoriteList(
          favoriteVideos: favoriteVideos,
        );
      }),
    );
  }
}
