import 'dart:developer';

import 'package:anime_app_flutter/anime/domain/models/TopAiringAnimeModel.dart';
import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/domain/resources/app_routes.dart';
import 'package:anime_app_flutter/common/presentation/component/image_with_shimmer.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalListView extends StatefulWidget {
  final List<AnimeData>? topAnimeAiringModel;
  final List<MangaData>? topMangaModel;
  final List<TopRatedItem>? topRatedItemList;
  final List<PopularMovieItem>? popularMovieItemList;

  const HorizontalListView(
      {super.key,
      this.topAnimeAiringModel,
      this.topMangaModel,
      this.topRatedItemList,
      this.popularMovieItemList});

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buildList() {
      if (widget.topAnimeAiringModel != null) {
        return widget.topAnimeAiringModel!
            .map((item) => buildItem(
                (item).images!.jpg!.largeImageUrl.toString(), item.malId.toString()))
            .toList();
      } else if (widget.topMangaModel != null) {
        return widget.topMangaModel!
            .map((result) =>
                buildItem((result).images!.jpg!.largeImageUrl.toString(), result.malId.toString()))
            .toList();
      } else if (widget.topRatedItemList != null) {
        return widget.topRatedItemList!
            .map((result) => buildItem(
                ApiConstants.posterPath + (result).posterPath.toString(),
                result.id.toString()))
            .toList();
      } else if (widget.popularMovieItemList != null) {
        return widget.popularMovieItemList!
            .map((result) => buildItem(
                ApiConstants.posterPath + (result).posterPath.toString(),
                result.id.toString()))
            .toList();
      } else {
        return [];
      }
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: buildList(),
    );
  }

  Widget buildItem(String imageUrl, String? id) {
    log(id.toString());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            AppRoutes.movieDetailsRoute,
            pathParameters: {'movieId': id.toString()},
          );
        },
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(12.0), // Adjust the radius as needed
          child: ImageWithShimmer(imageUrl: imageUrl, width: 125, height: 150),
        ),
      ),
    );
  }
}
