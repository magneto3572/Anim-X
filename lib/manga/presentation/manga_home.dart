import 'package:anime_app_flutter/common/domain/resources/app_strings.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/manga/presentation/component/horizontal_list_view.dart';
import 'package:anime_app_flutter/manga/presentation/component/titled_header.dart';
import 'package:anime_app_flutter/manga/presentation/component/horizontal_slider.dart';
import 'package:anime_app_flutter/manga/presentation/bloc/manga_bloc.dart';
import 'package:anime_app_flutter/manga/presentation/bloc/manga_event.dart';
import 'package:anime_app_flutter/manga/presentation/bloc/manga_state.dart';
import 'package:anime_app_flutter/services/service_locator.dart';
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
                      HorizontalSlider(
                          resultList: state.mangaAiringModel?.results),
                      const SizedBox(height: 20),
                      TitleHeader(
                          title: AppStrings.trendingAnime, onSeeAllTap: () {}),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 180.0,
                          child: HorizontalListView(
                              resultList: state.mangaAiringModel?.results)),
                      TitleHeader(
                          title: AppStrings.featuredAnime, onSeeAllTap: () {}),
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
