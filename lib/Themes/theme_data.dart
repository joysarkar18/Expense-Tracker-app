import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    canvasColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      filled: true, //<-- SEE HERE
      fillColor: Color.fromARGB(255, 124, 186, 237), //<-- SEE HERE
    ),
  );
  static final dark = ThemeData(
    appBarTheme: const AppBarTheme(
        color: Colors.black, iconTheme: IconThemeData(color: Colors.white)),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      filled: true, //<-- SEE HERE
      fillColor: Color.fromARGB(255, 124, 186, 237), //<-- SEE HERE
    ),
  );
}
