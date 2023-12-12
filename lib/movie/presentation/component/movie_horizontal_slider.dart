import 'dart:math';

import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/domain/resources/app_colors.dart';
import 'package:anime_app_flutter/common/presentation/component/image_with_shimmer.dart';
import 'package:anime_app_flutter/common/presentation/component/text_with_dot_indicator.dart';
import 'package:anime_app_flutter/movie/domain/models/upcoming_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieHorizontalSlider extends StatefulWidget {
  final List<UpcomingMovieItem>? resultList;

  const MovieHorizontalSlider({super.key, required this.resultList});

  @override
  _MovieHorizontalSliderState createState() => _MovieHorizontalSliderState();
}

class _MovieHorizontalSliderState extends State<MovieHorizontalSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: min(3, widget.resultList!.length),
            itemBuilder: ((context, index, realIndex) {
              return ImageWithShimmer(
                imageUrl: ApiConstants.posterPath +
                    widget.resultList![_currentIndex].posterPath!,
                width: double.infinity,
                // this is required paremeter that is why we are adding since this will not effect beacse we already applied aspect ration to parents
                height: 0,
              );
            }),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  if (index < 3) {
                    _currentIndex = index;
                  }
                });
              },
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 12 / 16,
              autoPlayCurve: Curves.easeInOutCubicEmphasized,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1.0,
            ),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  DarkAppColors.black,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        widget.resultList![_currentIndex].title!,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          min(
                              3,
                              widget.resultList![_currentIndex].genreIds!
                                  .length), (index) {
                        return TextWithDotIndicator(
                            widget.resultList![_currentIndex].genreIds![index]
                                .toString(),
                            index < 2);
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(min(3, widget.resultList!.length),
                          (index) {
                        double opac = (1 - (_currentIndex - index).abs() / 3)
                            .clamp(0.2, 1.0);
                        double transformValue =
                            (1 - (_currentIndex - index).abs() / 3)
                                .clamp(0.5, 1.0);
                        return Opacity(
                          opacity: opac,
                          child: Transform.scale(
                            scale: transformValue,
                            child: Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? Color.fromARGB(255, 255, 255, 255)
                                    : Color.fromARGB(255, 176, 176, 176),
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
