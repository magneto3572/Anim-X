import 'dart:math';


import 'package:anime_app_flutter/anime/domain/models/TopMangaModel.dart';
import 'package:anime_app_flutter/common/domain/resources/app_colors.dart';
import 'package:anime_app_flutter/common/presentation/component/image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnimeHorizontalSlider extends StatefulWidget {
  final List<MangaData>? topAnimeAiringModelList;

  const AnimeHorizontalSlider({super.key, required this.topAnimeAiringModelList});

  @override
  _AnimeHorizontalSliderState createState() => _AnimeHorizontalSliderState();
}

class _AnimeHorizontalSliderState extends State<AnimeHorizontalSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: min(widget.topAnimeAiringModelList!.length, 3),
            itemBuilder: ((context, index, realIndex) {
              return ImageWithShimmer(
                imageUrl: widget.topAnimeAiringModelList![_currentIndex].images!.jpg!.largeImageUrl.toString() ,
                width: double.infinity,
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
                      widget.topAnimeAiringModelList![_currentIndex].title!,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(
                  //       min(3,
                  //           widget.topAnimeAiringModelList![_currentIndex].genres!.length),
                  //       (index) {
                  //     return TextWithDotIndicator(
                  //         widget.topAnimeAiringModelList![_currentIndex].genres![index]
                  //             .toString(),
                  //         index < 2);
                  //   }),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(min(3, widget.topAnimeAiringModelList!.length),
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
            ),
          )
        ],
      ),
    );
  }
}
