import 'package:flutter/material.dart';
import 'package:smart_house_remote/state/navigation/reducer.dart';
import 'package:smart_house_remote/state/theme/reducer.dart';

class AppState {
  ThemeMode themeMode;
  List<String> routes;
  AppState({this.themeMode = ThemeMode.light, this.routes = const []});

  static AppState reducer(AppState state, action) {
    return AppState(
        themeMode: themeModeReducer(state.themeMode, action),
        routes: navigationReducer(state.routes, action));
  }
}
