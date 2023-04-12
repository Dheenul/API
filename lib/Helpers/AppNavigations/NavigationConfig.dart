// ignore_for_file: constant_identifier_names, file_names, non_constant_identifier_names


import '../../Pages/HomeScreen/HomeScreen.dart';
import 'NavigationHelpers.dart';

// Declare the Routes as Enum and add the pages in our application.
enum Routes {
  
  // Name of page. 
  HomeScreen,
}

// Create class named Pages which holds the pages in the application 
class Pages{ 
   
  // Create page configuration for the page named HomeScreen which requires a data while build.
  static final PageConfig homeScreenConfig = PageConfig(route: Routes.HomeScreen , build: (_) => HomeScreen(extraData: homeScreenConfig.data));
}