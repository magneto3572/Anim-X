import 'package:anime_app_flutter/anime/presentation/bloc/animeHomeBloc/manga_state.dart';
import 'package:anime_app_flutter/anime/presentation/component/anime_horizontal_slider.dart';
import 'package:anime_app_flutter/common/domain/resources/app_strings.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/common/domain/services/service_locator.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/animeHomeBloc/manga_bloc.dart';
import 'package:anime_app_flutter/anime/presentation/bloc/animeHomeBloc/manga_event.dart';
import 'package:anime_app_flutter/common/presentation/component/horizontal_list_view.dart';
import 'package:anime_app_flutter/common/presentation/component/titled_header.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MangaHome extends StatelessWidget {
  const MangaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MangaBloc>()..add(GetMangaEvent()),
      child: Scaffold(
        body: BlocBuilder<MangaBloc, MangaState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestStatus.loaded:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimeHorizontalSlider(
                          resultList: state.mangaAiringModel!.results),
                      const SizedBox(height: 20),
                      TitleHeader(
                          title: AppStrings.trendingAnime, onSeeAllTap: () {}),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 180.0,
                          child: HorizontalListView(
                              resultList: state.mangaAiringModel?.results)),
                      TitleHeader(
                          title: AppStrings.featuredAnime, onSeeAllTap: () {}),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 180.0,
                          child: HorizontalListView(
                              featuredMangaItemList:
                                  state.featuredMangaModel?.results)),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              case RequestStatus.error:
                return const Text("Something Went Wrong");
            }
          },
        ),
      ),
    );
  }
}
