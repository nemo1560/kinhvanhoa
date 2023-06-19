import 'package:flutter/material.dart';

class Utility{
  static late Size size;
  static String urlImage = 'https://isach.info/images/story/cover/kinh_van_hoa_';

  static ThemeData darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  static ThemeData lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));

}