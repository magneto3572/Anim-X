import 'package:anime_app_flutter/common/page/basepage.dart';
import 'package:anime_app_flutter/common/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String mangaPath = '/manga';
const String moviePath = '/movie';
const String bookPath = '/books';
const String watchlistPath = '/watchlist';
const String tvShowsPath = '/tvShows';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: mangaPath, routes: [
    ShellRoute(
        builder: (context, state, child) => BasePage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.mangaRoute,
            path: mangaPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Text("This is text 1"),
            ),
          ),
          GoRoute(
            name: AppRoutes.movieRoute,
            path: moviePath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Text("This is text 2"),
            ),
          ),
          GoRoute(
            name: AppRoutes.bookRoutes,
            path: bookPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Text("This is text 3"),
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
