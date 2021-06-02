import 'package:flutter/material.dart';
import 'package:smart_house_remote/state/theme/actions.dart';

ThemeMode themeModeReducer(ThemeMode themeMode, action) {
  if (action is ThemeChanged)
    return action.themeMode;
  else
    return themeMode;
}
