import 'package:anime_app_flutter/common/domain/resources/app_router.dart';
import 'package:anime_app_flutter/common/domain/resources/app_strings.dart';
import 'package:anime_app_flutter/common/presentation/theme/app_theme.dart';
import 'package:anime_app_flutter/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      darkTheme: getDarkApplicationTheme(),
      theme: getLightApplicationTheme(),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      routerConfig: AppRouter().router,
    );
  }
}
