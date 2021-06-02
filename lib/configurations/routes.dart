import 'package:flutter/material.dart';
import 'package:smart_house_remote/screens/dinning_table.dart';
import 'package:smart_house_remote/screens/home.dart';

class AppRoutes {
  static String get initRoute => HomeScreen.routeName;
  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case DinningTable.routeName:
        return MaterialPageRoute(builder: (context) => DinningTable());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
