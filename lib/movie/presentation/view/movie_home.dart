import 'package:anime_app_flutter/common/domain/resources/app_strings.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/common/domain/services/service_locator.dart';
import 'package:anime_app_flutter/common/presentation/component/horizontal_list_view.dart';
import 'package:anime_app_flutter/common/presentation/component/main_loading_shimmer.dart';
import 'package:anime_app_flutter/common/presentation/component/titled_header.dart';
import 'package:anime_app_flutter/movie/presentation/bloc/movie_home_bloc/movie_bloc.dart';
import 'package:anime_app_flutter/movie/presentation/bloc/movie_home_bloc/movie_state.dart';
import 'package:anime_app_flutter/movie/presentation/component/movie_horizontal_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_home_bloc/movie_event.dart';

class MovieHome extends StatelessWidget {
  final int id = 1;
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBloc>()..add(GetMovieEvent(id)),
      child: Scaffold(
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const MainLoadingShimmer();
              case RequestStatus.loaded:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieHorizontalSlider(
                          resultList: state.upcomingMovieModel!.results),
                      const SizedBox(height: 20),
                      TitleHeader(
                          title: AppStrings.topRated, onSeeAllTap: () {}),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 180.0,
                          child: HorizontalListView(
                              topRatedItemList: state.topRatedModel!.results)),
                      TitleHeader(
                          title: AppStrings.popular, onSeeAllTap: () {}),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 180.0,
                          child: HorizontalListView(
                              popularMovieItemList:
                                  state.popularMovieModel?.results)),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              case RequestStatus.error:
                return const Center(child: Text("Something Went Wrong"));
            }
          },
        ),
      ),
    );
  }
}
