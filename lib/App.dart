// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Helpers/AppNavigations/NavigationConfig.dart';
import 'Helpers/AppNavigations/NavigationHelpers.dart';

// Create a class named App by extending StatelessWidget class.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blueAccent
      ),
      debugShowCheckedModeBanner: false,

      // Pass the pageconfig of the initial page in AppRouteto initialPage parameter to map the initial route
      onGenerateRoute: AppRoute(
        initialPage: Pages.homeScreenConfig,
        initialPageData: "",
      ).onGenerateRoute,
    );
  }
}
