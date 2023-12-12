import 'package:anime_app_flutter/common/data/network/api_constants.dart';
import 'package:anime_app_flutter/common/domain/resources/app_colors.dart';
import 'package:anime_app_flutter/common/domain/services/service_locator.dart';
import 'package:anime_app_flutter/common/domain/utils/enums.dart';
import 'package:anime_app_flutter/common/presentation/component/image_with_shimmer.dart';
import 'package:anime_app_flutter/common/presentation/component/main_loading_shimmer.dart';
import 'package:anime_app_flutter/movie/domain/models/movie_detail_model.dart';
import 'package:anime_app_flutter/movie/presentation/bloc/movie_detail_bloc/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends StatelessWidget {
  final int movieId;
  const MovieDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(GetMovieDetailEvent(movieId)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const MainLoadingShimmer();
              case RequestStatus.loaded:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTopMainSection(context, state.movieDetails),
                      const SizedBox(
                        height: 16,
                      ),
                      getTrailerButtonWidget(context, state.movieDetails),
                      const SizedBox(
                        height: 16,
                      ),
                      getBottomSection(context, state.movieDetails),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          "Cast",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      getSimilarSection(context, state.movieDetails),
                      const SizedBox(
                        height: 8,
                      ),
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

Widget getTrailerButtonWidget(BuildContext context, MovieDetailModel? movieDetailModel) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(40.0), // Adjust the radius as needed
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(40.0),
            onTap: () {
        
              _launchUrl(Uri.parse(ApiConstants.baseVideoUrl + movieDetailModel!.videos!.results![0].key.toString()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_filled_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  SizedBox(width: 5),
                  Text("Watch Trailer")
                ],
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 16),
        padding:const EdgeInsets.all(16),
        height: null,
        width: null,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(40.0), // Adjust the radius as needed
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(40.0),
          onTap: () {
      
            _launchUrl(Uri.parse(ApiConstants.baseVideoUrl + movieDetailModel!.videos!.results![0].key.toString()));
          },
          child: Container(
            child: const Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                  size: 24.0,
                ),
          ),
        ),
      ),
    ],
  );
}

Widget getTopMainSection(
    BuildContext context, MovieDetailModel? movieDetailModel) {
  return Container(
    margin: const EdgeInsets.all(2),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image.network(
            ApiConstants.posterPath + movieDetailModel!.backdropPath.toString(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 500,
          ),
        ),
        Positioned(
          top: 50.0,
          left: 16.0,
          child: Center(
            child: Material(
              color: Colors.transparent,
              elevation: 4.0,
              child: InkWell(
                onTap: () {
                   Navigator.of(context).pop();
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: DarkAppColors.secondaryBackground,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: DarkAppColors.secondaryText, // Icon color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 30.0,
            left: 20.0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    movieDetailModel.originalTitle.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movieDetailModel.tagline.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(59, 134, 134, 134)
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(
                          40.0), // Adjust the radius as needed
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24.0,
                        ),
                        const SizedBox(
                            width:
                                8.0), // Add some space between the icon and text
                        Text(
                          "${movieDetailModel.voteAverage!.toStringAsFixed(1)}/10",
                        ),
                      ],
                    ),
                  ),
                ])),
      ],
    ),
  );
}

Widget getBottomSection(
    BuildContext context, MovieDetailModel? movieDetailModel) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieDetailModel!.originalTitle.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieDetailModel.genres?.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: DarkAppColors.secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      movieDetailModel.genres![index].name.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(movieDetailModel.overview.toString(),
            style: const TextStyle(
                color: Color.fromARGB(255, 103, 103, 103), fontSize: 12.0))
      ],
    ),
  );
}

Widget getSimilarSection(
    BuildContext context, MovieDetailModel? movieDetailModel) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    width: double.infinity,
    height: 180,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieDetailModel!.credits!.cast!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(12.0), // Adjust the radius as needed
              child: ImageWithShimmer(
                  imageUrl:
                      "${ApiConstants.posterPath}/${movieDetailModel.credits?.cast![index].profilePath}",
                  width: 125,
                  height: 180),
            ),
          );
        }),
  );
}

Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch');
  }
}
