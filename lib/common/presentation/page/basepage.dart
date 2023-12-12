import 'package:anime_app_flutter/common/domain/resources/app_router.dart';
import 'package:anime_app_flutter/common/domain/resources/app_routes.dart';
import 'package:anime_app_flutter/common/domain/resources/app_strings.dart';
import 'package:anime_app_flutter/common/domain/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final String location = GoRouterState.of(context).matchedLocation;
          if (!location.startsWith(mangaPath)) {
            _onItemTapped(0, context);
          }
          return true;
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.manga,
            icon: Icon(
              Icons.animation_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.movie,
            icon: Icon(
              Icons.movie_creation_outlined,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.book,
            icon: Icon(
              Icons.book_outlined,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.tvshows,
            icon: Icon(
              Icons.tv_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.watchList,
            icon: Icon(
              Icons.bookmark_border_rounded,
              size: AppSize.s20,
            ),
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(mangaPath)) {
      return 0;
    }
    if (location.startsWith(moviePath)) {
      return 1;
    }
    if (location.startsWith(bookPath)) {
      return 2;
    }
    if (location.startsWith(tvShowsPath)) {
      return 3;
    }
    if (location.startsWith(watchlistPath)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.mangaRoute);
        break;
      case 1:
        context.goNamed(AppRoutes.movieRoute);
        break;
      case 2:
        context.goNamed(AppRoutes.bookRoutes);
        break;
      case 3:
        context.goNamed(AppRoutes.tvShowRoute);
        break;
      case 4:
        context.goNamed(AppRoutes.watchlistRoute);
        break;
    }
  }
}
