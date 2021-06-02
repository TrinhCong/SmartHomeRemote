import 'package:flutter/material.dart';

class ThemeAction {}

class ThemeChanged extends ThemeAction {
  ThemeMode themeMode;
  ThemeChanged(this.themeMode);
}
