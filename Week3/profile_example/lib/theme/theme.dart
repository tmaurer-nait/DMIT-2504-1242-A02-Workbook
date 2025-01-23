import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
    titleMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 20,
      fontFamily: 'PlaywriteIN',
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      fontFamily: 'PlaywriteIN',
    ),
  ),
);

ThemeData generateDarkTheme(ThemeData lightTheme) {
  return lightTheme.copyWith(
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: Colors.blueGrey);
}
