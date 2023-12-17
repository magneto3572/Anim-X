import 'package:anime_app_flutter/anime/presentation/view/manga_home.dart';
import 'package:anime_app_flutter/books/presentation/view/book_home.dart';
import 'package:anime_app_flutter/common/presentation/page/basepage.dart';
import 'package:anime_app_flutter/common/domain/resources/app_routes.dart';
import 'package:anime_app_flutter/movie/presentation/view/movie_details.dart';
import 'package:anime_app_flutter/movie/presentation/view/movie_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const String mangaPath = '/manga';
const String moviePath = '/movie';
const String bookPath = '/books';
const String watchlistPath = '/watchlist';
const String tvShowsPath = '/tvShows';
const String movieDetailsPath = 'movieDetails/:movieId';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: mangaPath, routes: [
    ShellRoute(
        builder: (context, state, child) => BasePage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.mangaRoute,
            path: mangaPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MangaHome(),
            ),
          ),
          GoRoute(
              name: AppRoutes.movieRoute,
              path: moviePath,
              pageBuilder: (context, state) => const NoTransitionPage(
                    child: MovieHome(),
                  ),
              routes: [
                GoRoute(
                  name: AppRoutes.movieDetailsRoute,
                  path: movieDetailsPath,
                  pageBuilder: (context, state) => CupertinoPage(
                    child: MovieDetails(
                      movieId: int.parse(state.pathParameters['movieId']!),
                    ),
                  ),
                )
              ]),
          GoRoute(
            name: AppRoutes.bookRoutes,
            path: bookPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: BookHome(),
            ),
          ),
          GoRoute(
            name: AppRoutes.tvShowRoute,
            path: tvShowsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Text("This is text 4"),
            ),
          ),
          GoRoute(
            name: AppRoutes.watchlistRoute,
            path: watchlistPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Text("This is text 5"),
            ),
          )
        ])
  ]);
}
