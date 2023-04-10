import 'package:flutter/material.dart';

import '../Constant/constant.dart';

class Themes {
  static final light = ThemeData(
    canvasColor: myBlue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        color: myBlue, iconTheme: IconThemeData(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      filled: true, //<-- SEE HERE
      fillColor: Color.fromARGB(255, 197, 233, 242), //<-- SEE HERE
    ),
  );
  static final dark = ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.black, iconTheme: IconThemeData(color: Colors.white)),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      filled: true, //<-- SEE HERE
      fillColor: Color.fromARGB(255, 87, 142, 176), //<-- SEE HERE
    ),
  );
}
