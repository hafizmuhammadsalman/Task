import 'package:covid_19/extension/colorExtension/colorExtension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeMyExtension on ThemeData {
  ThemeData lightMood() {
    Color color = const Color(0xFFFFFFFF);
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: color.colorBackground,
      primaryColor: color.colorPrimary,
      primaryColorDark: color.colorPrimaryDark,
      splashColor: color.colorPrimary,
      highlightColor: color.colorPrimary,
      unselectedWidgetColor: const Color(0xFF949596),
      selectedRowColor: color.colorAccent,

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: color.colorAccent,
        selectionColor: color.colorAccent,
        selectionHandleColor: color.colorAccent,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: color.colorPrimary,
        barBackgroundColor: const Color(0xFF121212),
        primaryContrastingColor: const Color(0xFF121212),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: color.colorAccent),
    );
  }
}
