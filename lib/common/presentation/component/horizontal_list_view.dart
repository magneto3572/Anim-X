import 'package:anime_app_flutter/anime/domain/models/manga_airing_model.dart';
import 'package:anime_app_flutter/anime/domain/models/manga_featured_model.dart';
import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/movie/domain/models/popular_movie_model.dart';
import 'package:anime_app_flutter/movie/domain/models/top_rated_movide_model.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  final List<FeatureMangaItem>? featuredMangaItemList;
  final List<Results>? resultList;
  final List<TopRatedItem>? topRatedItemList;
  final List<PopularMovieItem>? popularMovieItemList;

  const HorizontalListView(
      {Key? key,
      this.resultList,
      this.featuredMangaItemList,
      this.topRatedItemList,
      this.popularMovieItemList})
      : super(key: key);

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buildList() {
      if (widget.featuredMangaItemList != null) {
        return widget.featuredMangaItemList!
            .map((item) => buildItem((item).image.toString()))
            .toList();
      } else if (widget.resultList != null) {
        return widget.resultList!
            .map((result) => buildItem((result).image.toString()))
            .toList();
      } else if (widget.topRatedItemList != null) {
        return widget.topRatedItemList!
            .map((result) => buildItem(
                ApiConstants.posterPath + (result).posterPath.toString()))
            .toList();
      } else if (widget.popularMovieItemList != null) {
        return widget.popularMovieItemList!
            .map((result) => buildItem(
                ApiConstants.posterPath + (result).posterPath.toString()))
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

  Widget buildItem(String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the radius as needed
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
