import 'dart:math';

import 'package:anime_app_flutter/manga/domain/models/manga_airing_model.dart';
import 'package:anime_app_flutter/manga/presentation/component/text_with_dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HorizontalSlider extends StatefulWidget {
  final List<Results>? resultList;

  const HorizontalSlider({super.key, required this.resultList});

  @override
  _HorizontalSliderState createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
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
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(widget.resultList![_currentIndex].image!),
                  fit: BoxFit.cover,
                )),
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
              width: 300,
              bottom: 5.0,
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
                        min(3,
                            widget.resultList![_currentIndex].genres!.length),
                        (index) {
                      return TextWithDotIndicator(
                          widget.resultList![_currentIndex].genres![index]
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
              ))
        ],
      ),
    );
  }
}
